Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314C1621CC1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 20:13:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osU1l-0003mv-1F; Tue, 08 Nov 2022 14:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1osU1h-0003mA-LX
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 14:12:49 -0500
Received: from esa1.hc2706-39.iphmx.com ([68.232.153.39])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1osU1f-0001BN-Hb
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 14:12:49 -0500
X-IronPort-RemoteIP: 209.85.161.72
X-IronPort-MID: 238481557
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iU5L5KjY06NmqwwBz9bZgNRJX1613RIKZh0ujC45NGQN5FlHY01je
 htvUT2DM/2PN2DxKtp2bYu/8kxQ6JHdn9MySFFspC02RikW8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wRuPaojUGL2zBH5MrpOfcldEFOlGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiM+t5qK23CulQRrukoPD8fwXG8M49m/c3Gd/
 /0W3XC4YV9B0qQhA43xWTEBe811FfQuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYYGvb5JLWdNz
 NodMQEjRSzSotOd2JvuH4GAhux7RCXqFIYWu3UlyjaASPh5G9bMRKLF4dIe1zA17ixMNayGN
 oxJNHw2Mk2GPEcn1lQ/UfrSmM+hgmn5fydwok/TqKYqi4TW5FYqgOS9aYeIJbRmQ+0LpVbCh
 zPrpV/aAx0wP42NwifGyk+F07qncSTTHdh6+KeD3udnhUDWymENBRk+U1y9rv+kzEmkVLpix
 1c8/yMvqe018xXuQIanGRK/p3GAs1gXXN84//AG1TxhA5H8u26xblXohBYdADD6nKfanQAX6
 2I=
IronPort-HdrOrdr: A9a23:gU1/NayAjldTVrkPm3miKrPw4L1zdoMgy1knxilNoNJuA6ulfu
 SV7YkmPHjP+UossRAb6Kq90cy7K080mqQFg7X5UY3SOTUO/VHYU72KjrGSuAEIeReOj9K1vJ
 0IG8MOa+EYT2IK9foSiDPZLz9K+qjgzEnHv5a7815dCStHUeVP1TtYNyqsOnFKZWB9dOQE/V
 mnivavZQDMRZ3aVKqG77A+MIn+m+E=
Received: from mail-oo1-f72.google.com ([209.85.161.72])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 14:12:44 -0500
Received: by mail-oo1-f72.google.com with SMTP id
 e10-20020a4a91ca000000b0047f7bf95662so4022506ooh.8
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 11:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JnpE1KG21EOAhE4sTalgaBWeI5Ol5Ny9tzaB84uTx9g=;
 b=F4SPGrQ6LGGhKGhQmAwcNrzwCIJyeyWa17L1W2xLk9cuVBGVFKU22+VbMMi5PVvQbl
 BiXOgSrclwD8LqY/kPubFJeVBYAz2hA/AstXzBfnPD1vvPLR8NJXno6npTamhd1d5iBg
 vxpQi2OJhY9vMEC0G423ClddWoh22N5w3YVGcBUD9BX7Neu007bC0GAa3wjdYKYxr+/2
 2aPhJ4Ve4DE8SAqf7U5ABPUf+coXTrdsBEwSABslK4MXcneScoTeepTcjmcQBomPWgik
 iOQ1FNlDuMzK+zs3savpPmW2Zk7nb3KJzxuoT1caMAQ4Fow9X3/Bwd7AfPPUuTn2crD7
 cEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JnpE1KG21EOAhE4sTalgaBWeI5Ol5Ny9tzaB84uTx9g=;
 b=M7w2SM/WXDFM8kvCo7HUYnwy4LQERyT8J71lB/81ehK5FPaxX4TzrKlxs2w5hW4DkD
 XRUgxd3lrIGtO4pVyOCQfZ6M727SdTk6KclSU3CZEqU5D4yVpgY4d97/AZcalJ/HoCIt
 KrxzjzjedAe98pwtqxzNc9D9Oh0anR/68zg+ZQD9nckQsdsEVxJqN2+m2lQCujgWfmJE
 Z5Q6fS6Cb6plpIx/jGwClXTkncteSvVUwHJvHnamtTQcph3wpuDyzWbmM3/r9hO6GUye
 tUJaiP9djkh/BsCRyzyI1SwBot8uA7AGUODy2IuCdtPy8FvHcSvTpU485QZaaXtKdZfS
 FZAQ==
X-Gm-Message-State: ACrzQf1V6ucQnWViNvpdB1fhSJYqDGUrH/LJy3jpAtRl5o25JuOsGgZb
 YvrqdnKQ43mfbK1pwBxfawPCy8pJqlQF0IQuxsmt0mmxsVVNgUp+3sQrXZ658/1g6aDYk/Z8RmI
 84HZ8QzMobAokTkqMHC2ZRJ8UcC07KA==
X-Received: by 2002:aca:1a13:0:b0:35a:745a:8cc3 with SMTP id
 a19-20020aca1a13000000b0035a745a8cc3mr9747027oia.216.1667934763646; 
 Tue, 08 Nov 2022 11:12:43 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5KWPTm1Hi5WFGbfYh8udv5XTqXPPLv8Sy5ULDL95xJcrl9fGgd+TurqgUIH44VxEullygf0w==
X-Received: by 2002:aca:1a13:0:b0:35a:745a:8cc3 with SMTP id
 a19-20020aca1a13000000b0035a745a8cc3mr9746987oia.216.1667934762724; 
 Tue, 08 Nov 2022 11:12:42 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a056808054900b00350743ac8eesm3756047oig.41.2022.11.08.11.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 11:12:42 -0800 (PST)
Date: Tue, 8 Nov 2022 14:12:08 -0500
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
Message-ID: <20221108191208.cbswzkaib2cpysa4@mozz.bu.edu>
References: <20221107221236.47841-1-philmd@linaro.org>
 <20221107221236.47841-2-philmd@linaro.org>
 <20221108172544.7vvu7wcwyqmhfv3q@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221108172544.7vvu7wcwyqmhfv3q@mozz.bu.edu>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.153.39; envelope-from=alxndr@bu.edu;
 helo=esa1.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7,
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

On 221108 1225, Alexander Bulekov wrote:
> On 221107 2312, Philippe Mathieu-Daudé wrote:
> > When sdhci_write_block_to_card() is called to transfer data from
> > the FIFO to the SD bus, the data is already present in the buffer
> > and we have to consume it directly.
> > 
> > See the description of the 'Buffer Write Enable' bit from the
> > 'Present State' register (prnsts::SDHC_SPACE_AVAILABLE) in Table
> > 2.14 from the SDHCI spec v2:
> > 
> >   Buffer Write Enable
> > 
> >   This status is used for non-DMA write transfers.
> > 
> >   The Host Controller can implement multiple buffers to transfer
> >   data efficiently. This read only flag indicates if space is
> >   available for write data. If this bit is 1, data can be written
> >   to the buffer. A change of this bit from 1 to 0 occurs when all
> >   the block data is written to the buffer. A change of this bit
> >   from 0 to 1 occurs when top of block data can be written to the
> >   buffer and generates the Buffer Write Ready interrupt.
> > 
> > In our case, we do not want to overwrite the buffer, so we want
> > this bit to be 0, then set it to 1 once the data is written onto
> > the bus.
> > 
> > This is probably a copy/paste error from commit d7dfca0807
> > ("hw/sdhci: introduce standard SD host controller").
> > 
> > Reproducer:
> > https://lore.kernel.org/qemu-devel/CAA8xKjXrmS0fkr28AKvNNpyAtM0y0B+5FichpsrhD+mUgnuyKg@mail.gmail.com/
> > 
> > Fixes: CVE-2022-3872
> > Reported-by: RivenDell <XRivenDell@outlook.com>
> > Reported-by: Siqi Chen <coc.cyqh@gmail.com>
> > Reported-by: ningqiang <ningqiang1@huawei.com>
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Seems like OSS-Fuzz also found this, not sure why it never made it into
> a gitlab issue:
> https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=45986#c4
> 
> Slightly shorter reproducer:
> 
> cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
> 512M -nodefaults -device sdhci-pci -device sd-card,drive=mydrive -drive \
> if=none,index=0,file=null-co://,format=raw,id=mydrive -nographic -qtest \
> stdio
> outl 0xcf8 0x80001010
> outl 0xcfc 0xe0000000
> outl 0xcf8 0x80001001
> outl 0xcfc 0x06000000
> write 0xe0000058 0x1 0x6e
> write 0xe0000059 0x1 0x5a
> write 0xe0000028 0x1 0x10
> write 0xe000002c 0x1 0x05
> write 0x5a6e 0x1 0x21
> write 0x5a75 0x1 0x20
> write 0xe0000005 0x1 0x02
> write 0xe000000c 0x1 0x01
> write 0xe000000e 0x1 0x20
> write 0xe000000f 0x1 0x00
> write 0xe000000c 0x1 0x00
> write 0xe0000020 0x1 0x00
> EOF

Hi Philippe,
I ran the fuzzer with this series applied and it found:

cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
512M -nodefaults -device sdhci-pci -device sd-card,drive=mydrive -drive \
if=none,index=0,file=null-co://,format=raw,id=mydrive -nographic -qtest \
stdio
outl 0xcf8 0x80001010
outl 0xcfc 0xe0000000
outl 0xcf8 0x80001004
outw 0xcfc 0x06
write 0xe0000028 0x1 0x08
write 0xe000002c 0x1 0x05
write 0xe0000005 0x1 0x02
write 0x0 0x1 0x21
write 0x3 0x1 0x20
write 0xe000000c 0x1 0x01
write 0xe000000e 0x1 0x20
write 0xe000000f 0x1 0x00
write 0xe000000c 0x1 0x20
write 0xe0000020 0x1 0x00
EOF

The crash seems very similar, but it looks like instead of
SDHC_TRNS_READ this reproducer sets SDHC_TRNS_MULTI
-Alex

