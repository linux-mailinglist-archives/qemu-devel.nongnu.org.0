Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB49B3C68E4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 05:26:22 +0200 (CEST)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m393t-0001Ji-HI
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 23:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1m392d-0000Fg-3J
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 23:25:03 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:44552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1m392Z-0005Is-6v
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 23:25:02 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so1227990pjo.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 20:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=xdGSq4xkSbFxXKYKUFuqVQ2blLXXe589pueDmTQ1kLQ=;
 b=Z7SSti1r7ZYtrgVPpeeH2r6hlHIZ5+o3lxdPO5bY6q3qxAs6lAI5H9/b6z2YydLcjy
 INYt6fyZ3zyFQOAcStIqV1GlJVlzRbFJ7TqGr5sniQP4zOcPDKA60CqcntAl8ROa/nrR
 0d3bJSx3vsra+ziHIroMnTupdRV79KhD0bCTNrsQ3gkXc2ZZttFXsTtJmciPOzqBIElx
 b6r/BdC+qNrDdlS4C7xobBt/OF3YnNmimK69NdreTBYuJATevX4i1VKjWMwd5t6p1syA
 ZbGiVYRpR0q1qHo2nKA7LRbthhLzAuQDo1fG3nvlyst201s8IdeDCMMxo5+Doi4PY0hY
 sc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=xdGSq4xkSbFxXKYKUFuqVQ2blLXXe589pueDmTQ1kLQ=;
 b=jOwZ37UXXrsK2qFmhDTfp4BTc5aWO5Unpa03zgIaFUYlWwJwn7cAZaZr+Qb5Eyei/p
 qF6K6Jy24OSYoNfQ0wpWF4aOPiVkm+yQl4H15n2zk+PYqO82A/KJyf3LK3/23WP0y5rh
 gKVpiBq8nAtmepYQZIxl0CE3bFdDLY8ifAYiy0VcmiqgfjTAvF8xPgmDnS9jgrMUB7ti
 NV9r3WqurDEpLPTg08/pPo7icUEN5yOwwgoxoDYZV5YBk2P6T/eg9+Ze8HlJ5iv4u1zq
 iJlJm8isE20GMrEv4/xoo0cRhmoYE1Q3F7IsikvLc2+ZkG45OuM9jMBsE29nFhJWe7Sh
 hrtg==
X-Gm-Message-State: AOAM533ZOU/QdmNIpZEcMcXStZlaSXO1nfLOP9pVK2Hy7Qu6pUDjrIUv
 t9QCVUoALjEvs8p2E2SB2khNPw==
X-Google-Smtp-Source: ABdhPJykMrNdss8IIaGueZniHnan9XcyHSi52ahpCYgyfFj6DDgxI/qzhUjV3WoVtcmZI6PJnqUMKQ==
X-Received: by 2002:a17:90a:3c8d:: with SMTP id
 g13mr17235810pjc.229.1626146696952; 
 Mon, 12 Jul 2021 20:24:56 -0700 (PDT)
Received: from localhost ([106.201.108.2])
 by smtp.gmail.com with ESMTPSA id q17sm17220379pfk.186.2021.07.12.20.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 20:24:55 -0700 (PDT)
Date: Tue, 13 Jul 2021 08:54:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] gitignore: Update with some filetypes
Message-ID: <20210713032453.edryxntclvrkko32@vireshk-i7>
References: <79262dbe1f7888eb02e1911501eebafa6f2f6400.1616583806.git.viresh.kumar@linaro.org>
 <877djl3d78.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877djl3d78.fsf@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26-05-21, 13:13, Alex Bennée wrote:
> 
> Viresh Kumar <viresh.kumar@linaro.org> writes:
> 
> > Update .gitignore to ignore .swp and .patch files.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

No one picked it up yet, do I need to do something here ?

-- 
viresh

