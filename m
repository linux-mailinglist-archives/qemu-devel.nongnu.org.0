Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8557969F7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 22:07:46 +0200 (CEST)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0APx-000630-Cc
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 16:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45195)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jimw@sifive.com>) id 1i0AP9-0005bS-DJ
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 16:06:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jimw@sifive.com>) id 1i0AP8-0007ci-CD
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 16:06:55 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40452)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jimw@sifive.com>) id 1i0AP8-0007b4-4U
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 16:06:54 -0400
Received: by mail-pl1-x644.google.com with SMTP id h3so12467pls.7
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 13:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gYuKJlJufpQ6maABKQTxUMxy5UrN7Ns1g6CYu+OMczo=;
 b=UFYivqW0Y1tl2OcsMCEoRe+bbB4z+MM7pHj/1wEbCmeToEbS8tqDYcIPgBXTMjJDvk
 kqSsNfEDbnLRS4am0piki5G+T0l6ntDNcmxP1l29kXrJZnJ65/sHy4BnqVqcj/1Fxujt
 IbFCwFHcPphRVu5yS2bZ1f4aIKtq18U9PvIXsNkAqs/Ksg3v9r9Isq7JknRy3/dZgfe7
 Ig5tTN1nLU4G93NmK5BeQN+C015Ksu8hzGdRQ5h37QPOLPZblrzXkHkLVlk7aZUitf9k
 f2W6Zy1XqsQw+WpV3Zs7NBSMtqnr0NDdjUzrajZ6V5yX4TL5TjKhcJMqY3gimE8utN/4
 nghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gYuKJlJufpQ6maABKQTxUMxy5UrN7Ns1g6CYu+OMczo=;
 b=E8ao4rkIWrNXgI1izdr3KHaTLSivV8DRb+TPtmoNedrvU5OZdbEInZ/x0FLJMpWx9x
 fMEklRgaHJyP+uknAIYa4fE2BhEFhsc4NrKwKr0nm0pNcI/A/zfVdZNWSpcLJTE0PTBs
 L/iq48EylX8ItNNrJt4zq4EkGSTNbVmq+XzABrfWL2fk7KoEcjGk1mf/rNyQHGjyiwFS
 oWiJg5DYHSMtQkW59RTGfjnelYlCTFL/3ZsWd/vIEsK208Nw5XBkvp85Otxz2iMsMPd6
 UO9A+AczZxEtYZKM29HZOaxcv4v/6rkEu3Sp89l7UIe6meLvaN5qvKcl+XU79VPVpvJ8
 byIQ==
X-Gm-Message-State: APjAAAUJzF27RgxTWrRNjRzbnLhcirHfv5gD0IZyawZTfH1qXV2FXSl5
 aO7x4WmZLYCspPEUKTrUIpoCkw==
X-Google-Smtp-Source: APXvYqyQXXFX+cvmbBOY1jpV5LGdlS95qo6914OG2rmoxjxrJiYgt1QgZesTUJJNEGXdfSUPqaBnig==
X-Received: by 2002:a17:902:7202:: with SMTP id
 ba2mr30793044plb.266.1566331612977; 
 Tue, 20 Aug 2019 13:06:52 -0700 (PDT)
Received: from [10.17.0.199] ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i137sm47203581pgc.4.2019.08.20.13.06.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 13:06:52 -0700 (PDT)
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>, qemu-devel@nongnu.org
References: <20190820143942.17371-1-georg.kotheimer@kernkonzept.com>
From: Jim Wilson <jimw@sifive.com>
Message-ID: <79a82be5-38a2-edeb-66a6-25d34246aea3@sifive.com>
Date: Tue, 20 Aug 2019 13:06:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820143942.17371-1-georg.kotheimer@kernkonzept.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [PATCH v2] RISC-V: Select FPU gdb xml file based
 on the supported extensions
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
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/19 7:39 AM, Georg Kotheimer wrote:
> The size of the FPU registers depends solely on the floating point
> extensions supported by the target architecture.
> However, in the previous implementation the floating point register
> size was derived from whether the target architecture is 32-bit or
> 64-bit.
> 
> To allow RVF without RVD, changes to riscv_gdb_get_fpu() and
> riscv_gdb_set_fpu() were necessary.
> 
> In addition fflags, frm and fcsr were removed from
> riscv-XXbit-csr.xml, as the floating point csr registers are only
> available, if a FPU is present.

The current XML files were identical to the XML files in gdb when 
implemented.  This seems to be existing practice, as this is true of all 
of the other targets I looked at when I implemented this.  Also, the 
file names are the same with a / replaced with a -.  These files are in 
the gdb/features/riscv dir in a gdb source tree.  It would be a shame to 
break this.  I'm not sure if they are still identical.  The gdb copies 
might have been updated since then, and may need to be copied into qemu 
to update qemu, but we don't have a dedicated gdb/qemu maintainer to do 
this.

I don't see a need to remove the fp csr's from the csr list.  There are 
other extension dependent CSRs, like hypervisor ones. I think it makes 
more sense for the csr list to contain all of the csrs, and then disable 
access to them if that extension is not enabled.  If there is a good 
reason to require changes to the csr XML files, then it probably should 
be discussed with the gdb developers too, so that the gdb and qemu 
copies of the files remain consistent.

Fixing the rvf/rvd 32/64-bit support is good.  That is a bug in my 
original implementation.

Jim

