Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879FB3E83A1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 21:26:31 +0200 (CEST)
Received: from localhost ([::1]:55014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDXOQ-0006JR-KT
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 15:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDXNV-0005ae-T1
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 15:25:33 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDXNU-0001kO-Ba
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 15:25:33 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m12so27728427wru.12
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 12:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mGAHkNm1s7znOZoTF4PbbCf/oWnqd81ZMk6B0OGl01M=;
 b=j9DS81xGF8cYvGXCeEmcyV/POYruvsgjhKjMB5WId+sxoy+pxcOujig1kp+5MhfFqJ
 Y7ECXyhlt9EVWKYST+wTT4USYQBP0PonAgGg24yUquHXZ9SsELtjVG77wIXGVsvMjfqH
 uudI2FLTKtV9NYcFxnbM0xdjibxcfUnheMePoN1LVRWZl/vTH1N2qqieG5B4SzBD//8t
 RmnmJelAUiO5pC57eiW5ElZzT0c4han0Sad9+moDc3gjl6uhM+WPGyQ1tMwv14bTLRFK
 f7aChoQE3y/7GWyRJ/Y+udxxHcNpP24SUf0UNq/mx4N3B2dYEloAc2R/POBgFatl4Gp/
 IBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mGAHkNm1s7znOZoTF4PbbCf/oWnqd81ZMk6B0OGl01M=;
 b=fkoYVX7uyVuKYepLf8iMlhDXs++6cq1RdPEl9xdHwSMhFglkMn9hzb+wioFU1y3dMI
 tvjcNaRB2qq4S1IEnZnQ12qbGCYwSmWrmb9nBHB+oPbeoTPtDMAQKxNaTfSUMVR+J6uB
 4/m1fRu5c6gA/G2OzXrNijWnwKZfz/pgBA2HAMpZHcI+4iEgNxfSOUO5rkTJp+FSE+Rp
 Q40P2J62FyzRf3FEBQm8vp94jIXVQlN/noT5LQAm3qPqHYqrdCua+JIpLHrhBiS2OfrE
 QraPzTPluzWKYeJBpBLdV2IiwfUWoCJh6YTSoCJoyIKo9n2jgWEdKO4mBj6Z4v3ZS+ma
 hnZg==
X-Gm-Message-State: AOAM531fs8yNBPiHY12AW5zP1UsS+y4ZCRuiQ9oEjvVNZvOPubx++vuk
 MIyVr58ufvYvfXzKu1EOCvU=
X-Google-Smtp-Source: ABdhPJyUt23RT9p5NFJ4sWsswHLsL3Hv6wIaO0YhAdJsSStqbsLTbVDJo/SKF59UwHrkCOI0SsuLLA==
X-Received: by 2002:a5d:6589:: with SMTP id q9mr33453764wru.284.1628623530801; 
 Tue, 10 Aug 2021 12:25:30 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y3sm13291076wma.32.2021.08.10.12.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 12:25:30 -0700 (PDT)
Subject: Re: [PATCH qemu 1/1] docs: how to use gdb with unix sockets
To: ~archi42 <sourcehut@mailhell.seb7.de>, qemu-devel@nongnu.org
References: <162861417028.13673.3981098709822414721-1@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c5ddb0c4-6bc7-0852-afc4-814130903586@amsat.org>
Date: Tue, 10 Aug 2021 21:25:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <162861417028.13673.3981098709822414721-1@git.sr.ht>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Sebastian Meyer <meyer@absint.com>, peter.maydell@linaro.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yay! Posting from sr.ht works \o/

On 8/10/21 6:04 PM, ~archi42 wrote:
> From: Sebastian Meyer <meyer@absint.com>
> 
> Signed-off-by: Sebastian Meyer <meyer@absint.com>
> ---
>  docs/system/gdb.rst | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
> index 144d083df3..2ff4d6aab5 100644
> --- a/docs/system/gdb.rst
> +++ b/docs/system/gdb.rst
> @@ -15,7 +15,8 @@ The ``-s`` option will make QEMU listen for an incoming connection
>  from gdb on TCP port 1234, and ``-S`` will make QEMU not start the
>  guest until you tell it to from gdb. (If you want to specify which
>  TCP port to use or to use something other than TCP for the gdbstub
> -connection, use the ``-gdb dev`` option instead of ``-s``.)
> +connection, use the ``-gdb dev`` option instead of ``-s``. See
> +further below for an example using unix sockets.)

Could we insert a link to the 'Using unix sockets' chapter?

>  
>  .. parsed-literal::
>  
> @@ -168,3 +169,24 @@ The memory mode can be checked by sending the following command:
>  
>  ``maintenance packet Qqemu.PhyMemMode:0``
>      This will change it back to normal memory mode.
> +
> +Using unix sockets
> +^^^^^^^^^^^^^^^^^^
> +
> +An alternate method for connecting gdb to the qemu gdbstub are unix

"QEMU"

> +sockets (if supported by your operating system). This is useful when
> +running serveral tests in parallel and/or you do not know a free tcp

"several", "know" -> "have", "TCP"

> +port a priori (e.g. when running automated tests).
> +First create a new chardev with the appropriate options, then

Drop "new"?

> +instruct the gdbserver to use that device::
> +
> +.. parsed-literal::
> +
> +   |qemu_system| -chardev socket,path=/tmp/gdb-socket,server=on,wait=off,id=gdb0 -gdb chardev:gdb0 -S -kernel bzImage -hda rootdisk.img -append "root=/dev/hda"

Maybe simply "-chardev
socket,path=/tmp/gdb-socket,server=on,wait=off,id=gdb0 -gdb chardev:gdb0
..."?

> +
> +Start gdb as before, but this time connect using the path to
> +the socket::
> +
> +   (gdb) target remote /tmp/gdb-socket
> +
> +Please mind that this usually requires gdb version 9.0 or newer.

"Note gdb version 9.0 or newer is required."?

