Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC170621A8E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 18:27:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osSMo-0001C5-Sm; Tue, 08 Nov 2022 12:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1osSMn-0001BQ-G4
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 12:26:29 -0500
Received: from esa10.hc2706-39.iphmx.com ([216.71.140.198])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1osSMl-0001J8-Ke
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 12:26:29 -0500
X-IronPort-RemoteIP: 209.85.210.69
X-IronPort-MID: 238069504
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8lCmyqsnMufoQaIf9g1h03as5OfnVOtcMUV32f8akzHdYApBsoF/q
 tZmKT3XPauPY2D8f4x0atm/o00AsZGGytVgHFRo/y4xFyJD9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVmNagR1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqU6yr9GOCJP0
 8YpdiAOSUi9pd2p7eiCH7wEasQLdKEHPasas3BkiDbFVLMoH8GFTKLN6ttVmjw3g6iiH96EP
 5tfOWcpNk2YJUMeUrsUIMtWcOOAj33vdTFCgFiI46c7/gA/ySQri+i1bouIIoDiqcN9jFrDn
 W/02HbCABgdPYek5GPcyH+Umbqa9c/8cMdIfFGizdZzjViOg2AeFhASfV28p/a/lwi5Qd03F
 qAP0i8nrKx381DyC9ejDlu3p3mLuhNaUN1VewEn1DywJmPvy17xLgA5ovRpObTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:Sd9MhKNgEcRSdsBcTgyjsMiBIKoaSvp037BL7TEKdfUxSKClfq
 +V7Y0mPG/P5Qr5NEtQ/exoQZPwIk80rKQFg7X5Xo3SJzUO2lHYSr2KhLGKqwEIfReOk9K1vp
 0QC5RWMsH6CVhmkMrgiTPYLz9P+qjhzImYwcz0yWtrRw0CUc5dBg1CajpyeidNLzWvbvACfq
 a0145mjxeKPUgtS62AaEU4Yw==
Received: from mail-ot1-f69.google.com ([209.85.210.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 12:26:16 -0500
Received: by mail-ot1-f69.google.com with SMTP id
 l23-20020a9d4c17000000b0066cf87fd9b1so2443592otf.16
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 09:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YQN5hTqT6TJasIwUwTbcU0gyqSa66mpchh6HujJ+enA=;
 b=L3L3EqrYW3c9W8/pCuVYxeka/C3SsdteyWg44KZobBV+pQXj/6dugN0JsUV91I7Fv0
 rLF2v62mtXEU6SX/5Ss7FQTydUeR8Rm/PkHyQUN9A5fQMuumTKQX2J4gbQW6Waf3V18T
 Ww+KYIJBt9fGk82DMb0NKwITOM3KLxAF+hqs93b+WEc1IBEa2Np7bhoUKrGUiN39v/ho
 0bRy8NjC41mGH7Yb2qh9AowgWjkZYmSHiQiQ6AvfnpPd6CfHLNNrBklNSeX+XmxAUTDV
 2geC/Bd9XMU1QyYQv+RXZmIKtjlcPpcj4mAKoy8faJGR7FbimiCbRZpTDj6Ce1UGfFNL
 wTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YQN5hTqT6TJasIwUwTbcU0gyqSa66mpchh6HujJ+enA=;
 b=D1MVLgCb0gHe4n853TsT85R62IyA4DrVfLTMMPKS0pW1PwiXAUZtr445YFAAA5yasA
 AP7CSsjBWOLu5G/ISOXCpIFdJmD7EKvwsjBMrTKQzMhNS2MKXQJDaSGqXB6KkBTjLLXj
 puqWR7aOXHwE/JhFuNDlV1mTNP6k3PnbgEr67djLZMY/jNUlA8aiQdSAbHZXiIx2W5lS
 wHgL+pENpm0dGUqXJi4UKsin0zrVs03P0ZpgEPhPgcfwDDMaqWq3vxdNFoyaM6yklTHq
 /JbP0Q2vG0yra4mjSEleEnYHY1UEhGMef9PqX0wB8bj50uQkKZ4u/nmwZH10qqGSHwQo
 wiew==
X-Gm-Message-State: ACrzQf0E3kTUtt4yLiG+l4/f7Jg7yhFxyZi6vZKoUbHO+ZJI0vcwfXVn
 qAbM8ivNXOr86SukezlrKCyI8qsF33ZOZVnoQihsSpMp0Lwjlt8X3aCL4vp0t2iT10qdFikHlQt
 ACJAdxW6cyJXejEeb0LR6NXR2y3NnDA==
X-Received: by 2002:aca:3b54:0:b0:35a:4879:ee2e with SMTP id
 i81-20020aca3b54000000b0035a4879ee2emr17533554oia.170.1667928374840; 
 Tue, 08 Nov 2022 09:26:14 -0800 (PST)
X-Google-Smtp-Source: AMsMyM71K/rkR+1/Spg2f+cs1Frje5Hc/hfeDi1nLqE4L7wy+eSfHECuxO2u4dlgNDy6lul+OOWGqA==
X-Received: by 2002:aca:3b54:0:b0:35a:4879:ee2e with SMTP id
 i81-20020aca3b54000000b0035a4879ee2emr17533489oia.170.1667928373111; 
 Tue, 08 Nov 2022 09:26:13 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a05683004c100b006619533d1ddsm4275607otd.76.2022.11.08.09.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 09:26:12 -0800 (PST)
Date: Tue, 8 Nov 2022 12:25:44 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 RivenDell <XRivenDell@outlook.com>, Siqi Chen <coc.cyqh@gmail.com>,
 ningqiang <ningqiang1@huawei.com>
Subject: Re: [PATCH-for-7.2 1/2] hw/sd/sdhci: Do not set Buf Wr Ena before
 writing block (CVE-2022-3872)
Message-ID: <20221108172544.7vvu7wcwyqmhfv3q@mozz.bu.edu>
References: <20221107221236.47841-1-philmd@linaro.org>
 <20221107221236.47841-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107221236.47841-2-philmd@linaro.org>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.198; envelope-from=alxndr@bu.edu;
 helo=esa10.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 221107 2312, Philippe Mathieu-Daudé wrote:
> When sdhci_write_block_to_card() is called to transfer data from
> the FIFO to the SD bus, the data is already present in the buffer
> and we have to consume it directly.
> 
> See the description of the 'Buffer Write Enable' bit from the
> 'Present State' register (prnsts::SDHC_SPACE_AVAILABLE) in Table
> 2.14 from the SDHCI spec v2:
> 
>   Buffer Write Enable
> 
>   This status is used for non-DMA write transfers.
> 
>   The Host Controller can implement multiple buffers to transfer
>   data efficiently. This read only flag indicates if space is
>   available for write data. If this bit is 1, data can be written
>   to the buffer. A change of this bit from 1 to 0 occurs when all
>   the block data is written to the buffer. A change of this bit
>   from 0 to 1 occurs when top of block data can be written to the
>   buffer and generates the Buffer Write Ready interrupt.
> 
> In our case, we do not want to overwrite the buffer, so we want
> this bit to be 0, then set it to 1 once the data is written onto
> the bus.
> 
> This is probably a copy/paste error from commit d7dfca0807
> ("hw/sdhci: introduce standard SD host controller").
> 
> Reproducer:
> https://lore.kernel.org/qemu-devel/CAA8xKjXrmS0fkr28AKvNNpyAtM0y0B+5FichpsrhD+mUgnuyKg@mail.gmail.com/
> 
> Fixes: CVE-2022-3872
> Reported-by: RivenDell <XRivenDell@outlook.com>
> Reported-by: Siqi Chen <coc.cyqh@gmail.com>
> Reported-by: ningqiang <ningqiang1@huawei.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Seems like OSS-Fuzz also found this, not sure why it never made it into
a gitlab issue:
https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=45986#c4

Slightly shorter reproducer:

cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
512M -nodefaults -device sdhci-pci -device sd-card,drive=mydrive -drive \
if=none,index=0,file=null-co://,format=raw,id=mydrive -nographic -qtest \
stdio
outl 0xcf8 0x80001010
outl 0xcfc 0xe0000000
outl 0xcf8 0x80001001
outl 0xcfc 0x06000000
write 0xe0000058 0x1 0x6e
write 0xe0000059 0x1 0x5a
write 0xe0000028 0x1 0x10
write 0xe000002c 0x1 0x05
write 0x5a6e 0x1 0x21
write 0x5a75 0x1 0x20
write 0xe0000005 0x1 0x02
write 0xe000000c 0x1 0x01
write 0xe000000e 0x1 0x20
write 0xe000000f 0x1 0x00
write 0xe000000c 0x1 0x00
write 0xe0000020 0x1 0x00
EOF



