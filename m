Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24816442B4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 12:58:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2WZ7-0002wW-TV; Tue, 06 Dec 2022 06:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2WZ5-0002wJ-SX
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 06:56:47 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2WZ0-0002A0-JY
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 06:56:44 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bs21so23125544wrb.4
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 03:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gjFsxNMgtXHevMPCZQECX7N6+lpgl9YYXpY/TF9hHpg=;
 b=HgFcedu4+/mK+KzF7O3cqQmFnBADrf85M/gi35X7aE98/Ne58S37+980SYpa2ToIQf
 lVBtb+a/p34bcUG5UI6plC95Dy+bCwgzuBCoSt+snETUGDNEriddaOLv7YhrRqWH8LSv
 vFL4zv0r1lUPdWuVyhTUdTaPhalIiLRGocoU9rqbaloVChAt3BMJKbjDaSJnH8Y1z+AS
 jtJklcBJVs7YshbC6cNCxbcNHoXpX0MsLw0vLtPusLgktbxnm7/rvfDgZ4H0bIaNKGsx
 ubIjWctpbfAQ8Hbw0P76+QRGCRlY/VY8+oz7VL5u7fNMwoYMWK/dqwYe6mTP/MWdHwNY
 gTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gjFsxNMgtXHevMPCZQECX7N6+lpgl9YYXpY/TF9hHpg=;
 b=KhX74oBcgWwrRMqyjMsWiXv1VHzIIPkjXcqftpS3QABqJeRKIOlbC5CUxyQzHxgXyh
 RzyagNGlGvXvihKRxmuXfGwf6TRYDBOantlYE31yRrcv6/1bNEqcKqWxRsassq2csHeT
 yHY6OKBMoq5W/p9tbtsx/cNi+EpAh8VG1HqN2yAEubLvHeTjKyUs01qsUyPpDFlP+5ec
 +FW43fmlIRMWwvakXrp15T73oSJ+AybYSmJA+H3+tmYr/zt6y0J4YMjWc3UdzufburCe
 v/theE3XNaZSe5Wman035j+U7LOFXTfcWw015IOme0vM3tT4UT7t4eslrwUg1thz1uGM
 qxsQ==
X-Gm-Message-State: ANoB5pnlxjP5YEa3LHkLH+kkAkO9mnicH4PLoJGuFcTpxQIGARaiLK2e
 EMHbub1gG+5nwZ/ya46um+wxWg==
X-Google-Smtp-Source: AA0mqf7BrIOTC9x7rcJVaKbVUJSu5CR/4JzggASn1NpzEhSqBpxbEuVtbvpbCrISHrN8hKVvXstGLQ==
X-Received: by 2002:adf:bb04:0:b0:241:f868:578e with SMTP id
 r4-20020adfbb04000000b00241f868578emr35797509wrg.516.1670327800538; 
 Tue, 06 Dec 2022 03:56:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m126-20020a1c2684000000b003d1d5a83b2esm4986052wmm.35.2022.12.06.03.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 03:56:40 -0800 (PST)
Message-ID: <fb95bd97-8d5f-b0eb-008b-47a96808a74f@linaro.org>
Date: Tue, 6 Dec 2022 12:56:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Fabrice Bellard <fabrice@bellard.org>, Michael Tokarev <mjt@tls.msk.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bmeng.cn@gmail.com>, Bernhard Beschow <shentey@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Thoughts on removing the TARGET_I386 part of
 hw/display/vga/vbe_portio_list[]
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

I'm trying to understand the x86 architecture-specific code in 
hw/display/vga.c:

     const MemoryRegionPortio vbe_portio_list[] = {
         { 0, 1, 2, .read = vbe_ioport_read_index,
                    .write = vbe_ioport_write_index },
     # ifdef TARGET_I386
         { 1, 1, 2, .read = vbe_ioport_read_data,
                    .write = vbe_ioport_write_data },
     # endif
         { 2, 1, 2, .read = vbe_ioport_read_data,
                    .write = vbe_ioport_write_data },
         PORTIO_END_OF_LIST(),
     };

Having:

     typedef struct MemoryRegionPortio {
         uint32_t offset;
         uint32_t len;
         unsigned size;
         uint32_t (*read)(...);
         void (*write)(...);
         ...
     } MemoryRegionPortio;

So on x86 we can have 16-bit I/O accesses unaligned to 8-bit boundary?

Looking at git-blame we have:

[1] 0a039dc700 ("vga: Convert to isa_register_portio_list")
[2] 09a79b4974 ("partial big endian fixes - change VESA VBE ports for 
non i386 targets to avoid unaligned accesses")
[3] 4fa0f5d292 ("added bochs VBE support")


[3] added:

   #ifdef CONFIG_BOCHS_VBE
      s->vbe_regs[VBE_DISPI_INDEX_ID] = VBE_DISPI_ID0;
      register_ioport_read(0x1ce, 1, vbe_ioport_read, 2);
      register_ioport_read(0x1cf, 1, vbe_ioport_read, 2);

      register_ioport_write(0x1ce, 1, vbe_ioport_write, 2);
      register_ioport_write(0x1cf, 1, vbe_ioport_write, 2);
   #endif

Back then, register_ioport_read() was:

   /* size is the word size in byte */
   int register_ioport_read(int start, int length,
                            IOPortReadFunc *func, int size)
   {
     int i, bsize;

     if (size == 1)
         bsize = 0;
     else if (size == 2)
         bsize = 1;
     else if (size == 4)
         bsize = 2;
     else
         return -1;
     for(i = start; i < start + length; i += size)
         ioport_read_table[bsize][i] = func;
     return 0;
   }

Indeed registering a 16-bit handler at the 8-bit aligned 0x1cf I/O address.

I wonder if this wasn't a typo, and we wanted to register two 8-bit
VBE handlers at offsets +0 and +1. IOW the code would have been:

   #ifdef CONFIG_BOCHS_VBE
      s->vbe_regs[VBE_DISPI_INDEX_ID] = VBE_DISPI_ID0;
      register_ioport_read(0x1ce, 1, vbe_ioport_read, 2);
      register_ioport_read(0x1ce, 2, vbe_ioport_read, 1);

      register_ioport_write(0x1ce, 1, vbe_ioport_write, 2);
      register_ioport_write(0x1ce, 2, vbe_ioport_write, 1);
   #endif

Because in that case, along with the code added in commit [2]:

  static uint32_t vga_mem_readw(target_phys_addr_t addr)
  {
      uint32_t v;
+#ifdef TARGET_WORDS_BIGENDIAN
+    v = vga_mem_readb(addr) << 8;
+    v |= vga_mem_readb(addr + 1);
+#else
      v = vga_mem_readb(addr);
      v |= vga_mem_readb(addr + 1) << 8;
+#endif
      return v;
  }

The 'ifdef TARGET_I386' (still from [2], converted in [1])
wouldn't have been necessary.

So I _think_ today we should be good with removing the x86 line:

-- >8 --
  static const MemoryRegionPortio vbe_portio_list[] = {
      { 0, 1, 2, .read = vbe_ioport_read_index, .write = 
vbe_ioport_write_index },
-# ifdef TARGET_I386
-    { 1, 1, 2, .read = vbe_ioport_read_data, .write = 
vbe_ioport_write_data },
-# endif
      { 2, 1, 2, .read = vbe_ioport_read_data, .write = 
vbe_ioport_write_data },
      PORTIO_END_OF_LIST(),
  };
---

*Except* if there is some hidden magic logic on the ISA bus...
Not per the ISA spec, but manufacturer/hardware specific.

I.e. the Jazz machines use a RC4030 which bridge ISA to the main
bus, and transparently handles misaligned CPU/DMA accesses to the
ISA address space.

This ISA topic was already mentioned before, see:

[a] 
https://lore.kernel.org/qemu-devel/20200720185758.21280-1-f4bug@amsat.org/
[b] 
https://lore.kernel.org/qemu-devel/20210305235414.2358144-1-f4bug@amsat.org/

Thoughts?

Thanks,

Phil.

