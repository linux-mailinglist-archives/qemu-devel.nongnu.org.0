Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BBD582756
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:04:06 +0200 (CEST)
Received: from localhost ([::1]:50312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGgho-0004Pk-Mo
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGgb3-00019j-Pb
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 08:57:11 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:34352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGgax-000537-OZ
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 08:57:02 -0400
Received: by mail-yb1-xb36.google.com with SMTP id i14so30104033yba.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jaILcpFOdNns/9Fm7gsbMoU7wVSdMqpKlfRiC6dW6XU=;
 b=ptk+lRnBLA/lv/TTqgbDM5tZTVueP+I1pJHqrIaZJBmAgxMpsWj1rQ3C23M2BKhH3l
 4ZSHM8DTPWVpP8xd+iw8446Jc9Ud3wvaP64ooh7M7MB3BcuLWiB+vNrT+I9gHxMuDsaF
 iS84h5d+vW6bHkDbSnfW4/Bi6jjxHNBo+pydqysAFt4YzxTMjl8saZ1FtCbSOuKEAb3H
 EGQHlYxi5M1QpMXTWDILg6MsHK4iRGwVQV916a7VWuLCB0uPuPNr6iRMfjc4YQoQ3bVb
 0sSYQekw90MHGR2SxYyMjeGk7Aq/LDy5ZNCj3gJABZPiOhTAQwH1uHKZpP8BodTi+6Fr
 E72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jaILcpFOdNns/9Fm7gsbMoU7wVSdMqpKlfRiC6dW6XU=;
 b=TQgOKNcO/D5/+BY2bP29vDVXoGVW9KZgfiDF5aONmxodwg2Pc3KDtTfHmw7MNsnbJ3
 RXkz0vY/jv0YhrZrTwLmnPzhXsPaGtWI8EwqrcguYOkNZrF/Di8CnTNOCFj0JsaAg1rf
 WwQR/q7wAMkAnlbB9CkWBjLkUY5G4BaP8BntHRMvjbqzIZehadNQGzLuIMHD/OWZ797V
 L963NpqDGBj3XP3p6USejHf9scmNi8jjKNjnHai5/QloRc6U+YUUg08O9ZnK5iB4FS1J
 v41UM3fR20R1LOT9jcQX6RJvpbFxj/qM9w0Z5zgHvJv3iqyh3wNtUWlswmvZY4ngdTrR
 /wGg==
X-Gm-Message-State: AJIora83+j9Eo7ERZjHUmQRTcN0yI35GdbX6LyfLLrvHx9g0+Sdwkn/2
 T2kVlmvTwUdXAa7WJsoqXsBFpSNTxG8VQ8OJzzVdfg==
X-Google-Smtp-Source: AGRyM1vOx9qBR94W5XgK6fX+UiG7lQ20DFOFSugYukqfzugjbzdekN9Fwk1PJzNvA3ptoJbQT5/KZdge2xeyAmiTl3c=
X-Received: by 2002:a5b:e90:0:b0:671:670a:594a with SMTP id
 z16-20020a5b0e90000000b00671670a594amr9358408ybr.193.1658926617407; Wed, 27
 Jul 2022 05:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220713165449.37433-1-ben.dooks@sifive.com>
 <20220727111320.5b7qobwx5bbwh65d@hetzy.fluff.org>
In-Reply-To: <20220727111320.5b7qobwx5bbwh65d@hetzy.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jul 2022 13:56:17 +0100
Message-ID: <CAFEAcA_aw002ZP6a=M5VyjVSs9Ln-Pv3ED0-eTtJj4bFM+KcJw@mail.gmail.com>
Subject: Re: updates for designware pci-host
To: Ben Dooks <qemu@ben.fluff.org>
Cc: Ben Dooks <ben.dooks@sifive.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>, 
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Wed, 27 Jul 2022 at 12:15, Ben Dooks <qemu@ben.fluff.org> wrote:
>
> On Wed, Jul 13, 2022 at 05:54:42PM +0100, Ben Dooks wrote:
> > As part of a project we have been looking at using the DesignWare
> > PCIe host. We found a few issues of missing features or small bugs
> > when using this with a recent Linux kernel (v5.17.x)
> >
> > Whilst doing this we also made a start on some tracing events.
>
> Hi, has anyone had a chance to review these. If so can this series
> get applied? If not should anyone else be added to the review list?
>
> If it would be easier I can try and find a git tree to publish this
> branch on if a pull request would be easier.

Is there a public spec for the hardware? There isn't anything
listed in the source file in the tree. Without the h/w specs
it's pretty difficult to review changes.

thanks
-- PMM

