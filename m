Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336564ED66C
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:02:45 +0200 (CEST)
Received: from localhost ([::1]:35564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqhY-00079Q-87
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:02:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZqUY-0003uV-Uc
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:49:19 -0400
Received: from [2607:f8b0:4864:20::b2f] (port=46618
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZqUX-00007f-J9
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:49:18 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id e81so12060102ybf.13
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jMy35fyZ6ftYzIcT1MNZMA8MrWOKwXs/LZWWaBdIgHA=;
 b=EssRytJeDBSboX2LuFKYIsE1zurqkNIthCdch3as/9ayYL3bvZThK/5uq/FIPDmo2g
 1E7meNGpjoQPDXUDeGS035EDW4Ck5h2tRj+rHKG60fbxRpHk1E2rfq0ewAPyhfHKfnVQ
 Z13PYf5U1epK5pzM4pSxSjOUSd7gef3jK0v+2KdTz/CMQqlg0bXf6oPiXyymvOtJWUFY
 Pnsbd6cx3cAnIQVztiHQ7lqq+sD9KjgcSS/SG2WKb4iJubadlzyZZVXrkmhT7xSHxI58
 d6CjGCnzUPVx4Mt6CerNR19EvJWPS2AfRN/lnzrWbIOnbK0Ufl6LkSCXr87+kGAKaTA5
 1WOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jMy35fyZ6ftYzIcT1MNZMA8MrWOKwXs/LZWWaBdIgHA=;
 b=midx9ImUKC4PzBiSBgnZoJsFEBMAR1FS50Y0s5DCkHKFaEXyrCYE5HHHkaQr7Be47+
 BypNFhMWLuqyP6YbQq0DjKNfi4lq+lXN3UEwwHCof/5Z/FTtIcQ/gXAyoNmdwAU24eZ+
 n9ePd7FzXDRL20Xn3RiXb91GW9LnvNIWVLAQ5N1EPA8Fe4YzYLaQcQOU5FGb4rCdt6xr
 JtFr0YbYEeNn9ekL+7hMUbX94kIs/q0EaHtTuELEEoX4W6BjDA7IcsIlcDjAQq2BWZmS
 6XOMDSs7hxW4w6itVTSQLQbf/CodHm9iKUL3hOAcwPYyxGaBYlUqer/2OIcs161dBvL5
 /DmA==
X-Gm-Message-State: AOAM533blf0tM6NXQHSDZwWlSEofvC2GBWcIpnLHRg9mKhJROMAY6RPP
 WPgz4s/SW0EgZxvsiXzILDcgCB6naiIh3Ej6NNjh76XshOhVXg==
X-Google-Smtp-Source: ABdhPJy7qACpSIfPI2BCCJAeAfM+thu2InWwKVT0uknXXbNTx2e3/xkrkbAAjxKJ00j6qpmE+/dTZ1d4IwxuhOM6PbE=
X-Received: by 2002:a25:7443:0:b0:637:18d3:eea5 with SMTP id
 p64-20020a257443000000b0063718d3eea5mr3246922ybc.39.1648716556695; Thu, 31
 Mar 2022 01:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <1648643217-15811-1-git-send-email-frederic.konrad@adacore.com>
In-Reply-To: <1648643217-15811-1-git-send-email-frederic.konrad@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 09:49:05 +0100
Message-ID: <CAFEAcA9kGH9jDGQtx2pq1L35_BuX10o9yA+nJqppPMRKLFDCpw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: change Fred Konrad's email address
To: Frederic Konrad <konrad@adacore.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Frederic Konrad <frederic.konrad@adacore.com>, qemu-devel@nongnu.org,
 chouteau@adacore.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Mar 2022 at 13:31, Frederic Konrad <konrad@adacore.com> wrote:
>
> frederic.konrad@adacore.com and konrad@adacore.com will stop working starting
> 2022-04-01.
>
> Use my personal email instead.
>
> Signed-off-by: Frederic Konrad <frederic.konrad@adacore.com>

I'll take this via target-arm.next since I'm putting a pullreq
together at the moment anyway.

thanks
-- PMM

