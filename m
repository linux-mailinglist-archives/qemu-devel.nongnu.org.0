Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E7C50B380
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:04:23 +0200 (CEST)
Received: from localhost ([::1]:60286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpD7-0001BQ-IK
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhouY-0001l5-Ht; Fri, 22 Apr 2022 04:45:06 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:43688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhouW-0007Ec-RN; Fri, 22 Apr 2022 04:45:06 -0400
Received: by mail-yb1-xb29.google.com with SMTP id f17so13234194ybj.10;
 Fri, 22 Apr 2022 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2P9u0tS5qqBflJKBDtJqY9w8fQXgkaWqfbKab/el4NM=;
 b=HzlbVw2mOo1HllRCNA3BZpelw+gFVTAIrC/PBY1zWB0+AtP88Fc+LB+GJNBlEu+A4I
 G/NRb5YiRN0zbh7l0AE9a/tJagPk9uVFeXlW3s+Tu5Ham++tpLqwPfCjaAA6Jpp+l3y6
 gG53HYpTjNi7Q2/ttylbIDiTOWdFWHWnuWARozfl6iwq6hHlSp3I767PPOxko8kuSsjK
 40W/f3EAXUZFgrPf1eQY1w8EitQLTdmDgiIcemFMokLs0PlBBtdebGKwVZ/obX+BamKG
 D3yPcPniPZlRru9NK0H2nUiQLEOC2YX3UAN+JOSXwg23GxKQjlcXo/kGTLhg/s/NjfeD
 ub8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2P9u0tS5qqBflJKBDtJqY9w8fQXgkaWqfbKab/el4NM=;
 b=EBBAGph66ZK8AlRsmmV1yzvqMTtS5qVi16qKHwBedGy180GUvv0rsjzGXNT43ilvi5
 lKCMgDgtVpqXCl36kyddkIU+z7sNFdCDXr59lxe+4Bc34vKot0Lejis49mAJD1mBn2fH
 sn4Np4jmVMbnYFe+zFKB2r6dp6ZcWr6fjuXlb2qFdHl6VIW0lZjW0GOiNw/1Vbq16Bqd
 81UrffmZbYMmjYI8nHtco5HJhjpOyDdOP/tsvQ0b4bcX96g8wLu69zaexcn4vhkxzBPJ
 26fJHBLno5MbGimCEcKhFBnpkEpktwCGLpI4WczdHlBFSgD5uQw1pJrj6s6VBhXojT/M
 OTkA==
X-Gm-Message-State: AOAM532Qe9LyZ/Lq5jlMb9adEYY6WqpGa2YoA3jbPIF9R3QDp+iaRyKj
 9jMRSGQZ1lqy3OwNlw67Idf1rnkoT/jd+yg3480=
X-Google-Smtp-Source: ABdhPJzxdFGjG3d59EfdE5fRlp4o5P/Iv1qu2MEPCP0/CPktNuEmLev1m6A+ZjX4D+S5AriwA+k9yp3Zm4/KAOQSbqA=
X-Received: by 2002:a05:6902:532:b0:644:b35d:a27 with SMTP id
 y18-20020a056902053200b00644b35d0a27mr3219491ybs.579.1650617101706; Fri, 22
 Apr 2022 01:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220422083403.1082924-1-sw@weilnetz.de>
In-Reply-To: <20220422083403.1082924-1-sw@weilnetz.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 16:44:50 +0800
Message-ID: <CAEUhbmWAMzp--b+V+2uZPuy8bUMn43OnK8FgWPF4k4qho2pCYA@mail.gmail.com>
Subject: Re: [PATCH] docs: Replace HomeBrew -> Homebrew
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 4:34 PM Stefan Weil <sw@weilnetz.de> wrote:
>
> The official spelling does not use camel case.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/about/build-platforms.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

