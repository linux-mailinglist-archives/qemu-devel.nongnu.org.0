Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F9457A732
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 21:24:47 +0200 (CEST)
Received: from localhost ([::1]:60992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDspq-0003YE-UZ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 15:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDsoV-0001Hx-G2
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:23:23 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:44838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDsoT-0005wb-Gr
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:23:23 -0400
Received: by mail-yb1-xb34.google.com with SMTP id h62so28194251ybb.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 12:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zwov2XOVM5mWcTohqWDlLS83HRJvI9q3u3xI9icGvA0=;
 b=nqzvnGH9OFt2Zy1znZHlUjz0yEVVw5guYaTyHE0mmvCp4AePSTmwrraXQUxYu7PxAT
 Sfh9qx5cm5wSwPxXqU0yuNF61nxYd9dKrfVMkGfY0a5OUACNNE4yrdrmle9zzKTaDB+m
 6zTtosQ788fOhyK90x6kee/GQ0H8+Xz9pCLthFKebyfWkS6vNbufvrKZbdhqK9FNClfo
 9EmY/zZaTgPyhGZ2Hz9sB+3h4NdVZ9URSZ4zhzE8Xg2f6m62JCNFRJV6rvzSKbpHiy4l
 lOl091JGSEuiGs+EKRWMERyeygMqo6ztsDUveBjfBoOHw+vGozcie8k3eDD2axQDJr96
 22HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zwov2XOVM5mWcTohqWDlLS83HRJvI9q3u3xI9icGvA0=;
 b=t/3xzgpSmTvaJKjSegzy6NW3LKFSGfWuoPj6E5Ao52djjlEhYbChfqg+1UHhNd0ZQC
 llO20kFKt4HEcPmN+hh8N0x6TFXJUFmPEIc9s3sDp72chArpS0JaL1303uBu+UTitzKU
 9IquLCYePGIFFFduo7xc7S3UNOFZhQkO6m8xomWZ6s6YX5iDhUaC3hPmiPjXsuAZ1H9o
 SUrSLhMEPb6UYVMIt2SWh9M9PfeAtDoHROGMfVw/vIbLHJ/Y5N9hHRRMD7q3Z1VCW2Oa
 BLlQ4M6prrxJwSawRHLJ3ByvL6MAcQw3JHiLQoXqKVhQD7x4/qZTXqko56T6VAkj6lKv
 pVDQ==
X-Gm-Message-State: AJIora8+nZVvpWS06Jxrihobz8gxmG7UgeDxxsG+lP66kwsg3VCLBIR4
 FMY1Eq99zt+iSRpUKwgSVP2hLffLKYUPDlJ1+0kqRg==
X-Google-Smtp-Source: AGRyM1spCRlPk2/l6ONhvG3Xp0AzGDN1ZhFuRsV3BDxKBMKuuemE8ytUpH8iaay641se+T7MvvWyhP0qnmAUSDgfBAM=
X-Received: by 2002:a25:bfc7:0:b0:66f:563c:d2e7 with SMTP id
 q7-20020a25bfc7000000b0066f563cd2e7mr32721730ybm.288.1658258599278; Tue, 19
 Jul 2022 12:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220719170221.576190-1-dgilbert@redhat.com>
In-Reply-To: <20220719170221.576190-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 20:23:08 +0100
Message-ID: <CAFEAcA9p_ngOFU6pvEXkQTNirf8Ub-pQ47+dsah-XQDrrAW6iw@mail.gmail.com>
Subject: Re: [PULL 00/29] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com, 
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com, 
 huangy81@chinatelecom.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jul 2022 at 18:16, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit da7da9d5e608200ecc0749ff37be246e9cd3314f:
>
>   Merge tag 'pull-request-2022-07-19' of https://gitlab.com/thuth/qemu into staging (2022-07-19 13:05:06 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220719c
>
> for you to fetch changes up to ec0345c1000b3a57b557da4c2e3f2114dd23903a:
>
>   migration: Avoid false-positive on non-supported scenarios for zero-copy-send (2022-07-19 17:33:22 +0100)
>
> ----------------------------------------------------------------
> Migration pull 2022-07-19
>
>   Hyman's dirty page rate limit set
>   Ilya's fix for zlib vs migration

I'm processing this pullreq, but while I think about it: once
we've got this fix in can we revert the workarounds we put in
our CI configs to set DFLTCC? (ie commit 309df6acb29346f)

thanks
-- PMM

