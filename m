Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52FB359618
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 09:12:13 +0200 (CEST)
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUlJM-0008V1-Rc
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 03:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUlIE-00083O-1B
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 03:11:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUlIB-0004hj-6z
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 03:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617952258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XyJYCmi5Yb4C5ddc5Bvd+hnn3Zo4DTi8Z9yyIcOd0YA=;
 b=DhVlnJbiRsU/9tP5TozD1MQqQJGDRPapl1cSi4FgWlQ9tVaqOvxNN20OwkOmOArcPiL2pQ
 5k78ciyiQigkoAVl8Cjqc8qFSvA6kCx2cnWFz6QlVeif8ThepU8L7rU96GicUAG3IjePzw
 7e1Rtaqi52WlJNRtiG9e5rVkCvmrHEQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-HKkEJReXNZ2MElpBjn9Xng-1; Fri, 09 Apr 2021 03:10:56 -0400
X-MC-Unique: HKkEJReXNZ2MElpBjn9Xng-1
Received: by mail-ed1-f72.google.com with SMTP id j18so2217872edv.6
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 00:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XyJYCmi5Yb4C5ddc5Bvd+hnn3Zo4DTi8Z9yyIcOd0YA=;
 b=iZoqsv69ttZBsyfBOFkboUeQPf3jOGJinpCtlwQi7IfQtQRuDdNA122Gun5uvp5a3P
 OkTQuRL+JliI3k7cWO2vDZki4LATxJZ8WrSPo8tzYzLFbE4NxOjtacmsV0dNUYNvW6f+
 dukU9TqGATiH13rEqoN88zwwUo8xWcMUiY/sla3DdhvgfyVarZgMPX3QfO7U9sDhbc1i
 Ud0O2Ev7s7JTLZ22HgKswe4s2AMY9esLS9CuHy/TuSpD4ff/U8s3UKT+1glYoV4jLIJF
 0mdHaaYnM25H0b8GAu/z5ZP4D/g97wUZtfzT2FSOE1vOlp0eoGakRW9HxzfJusMmMrTC
 51Ig==
X-Gm-Message-State: AOAM532TvpuJdL/APL/tfNTIt0gC8ImJPecZZmt456Q469NwuT5BCs1Y
 XCqo9Fh0l7dL0uth1CN8sCJQVnrbS1h4TBEk04d518MMQSnOgi3XFlqnpzZ6UU9ttJgEha0yUEB
 zwAHCdM7Hc1SfzDVUVrMzku1Pykc5RfrpwNzBVgyQPwTJzBLCPccg8Z+z01J+xQ4X
X-Received: by 2002:a50:e887:: with SMTP id f7mr15647551edn.107.1617952254328; 
 Fri, 09 Apr 2021 00:10:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAYMsp2q3IIiQOajOaZjnItHwj1QDgFu9yR1Lx/b/OyhHUsuXp3zjxyzO3lDpdnQ8wh0ZQzw==
X-Received: by 2002:a50:e887:: with SMTP id f7mr15647524edn.107.1617952254039; 
 Fri, 09 Apr 2021 00:10:54 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s9sm869803edd.16.2021.04.09.00.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 00:10:53 -0700 (PDT)
Subject: Re: [QUESTION] qemu: how to control the switch of floppy drive
To: "Xu, Yanfei" <yanfei.xu@windriver.com>, qemu-devel@nongnu.org
References: <910b1361-3b9f-ec80-794e-fb335b0ef631@windriver.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ab55b868-8797-70da-3e04-8221bc1fa01e@redhat.com>
Date: Fri, 9 Apr 2021 09:10:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <910b1361-3b9f-ec80-794e-fb335b0ef631@windriver.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 4/9/21 8:48 AM, Xu, Yanfei wrote:
> How can I disable the floppy controller drive when I boot a VM by qemu-
> system-x86_64? I did not specify any arguments about floppy, but after
> the qemu boots up, linux always can detect floppy drive and then
> modprobe the matched floppy.ko.
> 
> qemu version: v5.2
> 
> command line:
> 
> qemu-system-x86_64 -device virtio-net-
> pci,netdev=net0,mac=52:54:00:12:34:02 -netdev
> tap,id=net0,ifname=tap0,script=no,downscript=no -object rng-
> random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0
> -drive file=/path/to/images/qemux86-64
> /qemux86-64.ext4,if=virtio,format=raw -usb -device usb-tablet   -cpu
> core2duo -enable-kvm -m 512  -pidfile /path/to/pidfile_4167420 -m 512
> -snapshot -serial mon:vc -serial null  -kernel /path/to/qemux86-64
> /bzImage.bin -append 'root=/dev/vda rw  mem=512M
> ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1
> printk.time=1'
> 
> As I konw BIOS can control the switch of floppy controller on a real
> hardware, But how can I do it on qemu? And does the qemu enable that by
> default?

See
https://gitlab.com/qemu-project/qemu/-/blob/master/docs/qdev-device-use.txt#L105

* if=floppy

  -device floppy,unit=UNIT,drive=DRIVE-ID

  Without any -device floppy,... you get an empty unit 0 and no unit
  1.  You can use -nodefaults to suppress the default unit 0, see
  "Default Devices".

Regards,

Phil.


