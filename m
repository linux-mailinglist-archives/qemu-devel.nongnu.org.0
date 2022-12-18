Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF1864FF14
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 15:19:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6uUH-0006tH-LJ; Sun, 18 Dec 2022 09:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6uUF-0006so-8H
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 09:17:55 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6uUD-0005iX-Et
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 09:17:54 -0500
Received: by mail-ed1-x531.google.com with SMTP id i9so9703030edj.4
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 06:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1zzABat0d9AeYvUcKSVVM+dPU+FLGOG3XCQMVGDxoDw=;
 b=nQULDvE1EJwYOW6aR+YQVOymYiA5bHZsVGvrXTr9Z+VtgOkXlHaxYinIwsK+mKzroN
 8kGGC/86E4Y5StTsz7+/pHs2wbEU1gtJetICAli5EsnCIYQqtzkGLJ0GwU022DNw2Z5i
 ThPtjvU8YDgB7IuyD4yuiua87/PPfB7i3MoZqqrOOFRpVB+NnjLlq6tUeY1/a4ANWR83
 LsNoV3xU2K/8y9NH6Vy+TNyRI+LU6ad1QRatMZuSUjAMCT6bV4MiO9qT67g1mxNui+GL
 dDB7dcx/q07+vBWCccOoOK1/TUDU52MTcmDYfFkbIb/zDcLfGwrXES9zYlVM9Yagcz07
 3PPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1zzABat0d9AeYvUcKSVVM+dPU+FLGOG3XCQMVGDxoDw=;
 b=fd623ZKBuW9/73dqG/lQXff/J7Uytr/rNGiwu6qZyXPkS9t7TnRl4nU+USoYKWPEX9
 KqgMDLqGovcw5flkjBnQssh/LgfT9u9tXx378bhyMiC96PJXAqjqG9H/DU5+GOQFjdR2
 s42vKlTkXGCFZ/QvUUAPwqDPIL9/b2Q2qG5+x+RtW8aBkTB2pjodz9H5/qYDukXmHsJA
 ssg5eT+WHhDQQaXWs/W4QQzCXKxYwsmoo6Yf2ZMniFSRZTUqjc0dct8M6y57mOjI/Ky7
 r9bnSve0wasqPrWVxMZlc366fIso5+KcjNwnOdXYK4DQ09b6D0R1H2BFTLVen9v3wNrz
 tUiA==
X-Gm-Message-State: AFqh2krGI5kT7uK4q25QmhsSybaQvekcnUZIATWw/HAa038HD0ubozYx
 xvN2+fxARj8SraHi5e6g3+3jZQ==
X-Google-Smtp-Source: AMrXdXtTEXmf5l4W1/HUVejIAHdNMUUMYDXn6R7yqHvOLzEOIZ8FxItNmmOyOPmPtqtSwx3gn6hOTQ==
X-Received: by 2002:a05:6402:4b:b0:479:dc9c:1144 with SMTP id
 f11-20020a056402004b00b00479dc9c1144mr1024844edu.24.1671373071630; 
 Sun, 18 Dec 2022 06:17:51 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a50fa86000000b004616b006871sm3157963edr.82.2022.12.18.06.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 06:17:51 -0800 (PST)
Message-ID: <3aace928-1f23-acc3-9643-29f540b3f744@linaro.org>
Date: Sun, 18 Dec 2022 15:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 00/32] Consolidate PIIX south bridges
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20221204190553.3274-1-shentey@gmail.com>
 <B5EE1B75-28AF-406F-96BE-9247E1D1C08D@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <B5EE1B75-28AF-406F-96BE-9247E1D1C08D@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 18/12/22 11:33, Bernhard Beschow wrote:
> 
> 
> Am 4. Dezember 2022 19:05:21 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> This series consolidates the implementations of the PIIX3 and PIIX4 south
>>
>> bridges and is an extended version of [1]. The motivation is to share as much
>>
>> code as possible and to bring both device models to feature parity such that
>>
>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine. This
>>
>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on this
>>
>> list before.
>>
>>
>>
>> The series is structured as follows: First, PIIX3 is changed to instantiate
>>
>> internal devices itself, like PIIX4 does already. Second, PIIX3 gets prepared
>>
>> for the merge with PIIX4 which includes some fixes, cleanups, and renamings.
>>
>> Third, the same is done for PIIX4. In step four the implementations are merged.
>>
>> Since some consolidations could be done easier with merged implementations, the
>>
>> consolidation continues in step five which concludes the series.
>>
>>
>>
>> One particular challenge in this series was that the PIC of PIIX3 used to be
>>
>> instantiated outside of the south bridge while some sub functions require a PIC
>>
>> with populated qemu_irqs. This has been solved by introducing a proxy PIC which
>>
>> furthermore allows PIIX3 to be agnostic towards the virtualization technology
>>
>> used (KVM, TCG, Xen). Due to consolidation PIIX4 gained the proxy PIC as well.
>>
>>
>>
>> Another challenge was dealing with optional devices where Peter already gave
>>
>> advice in [1] which this series implements.
>>
>>
>>
>> A challenge still remains with consolidating PCI interrupt handling. There are
>>
>> still board-specific piix3_pci_slot_get_pirq() and piix4_pci_slot_get_pirq()
>>
>> which are implemented in isa/piix.c. Any advice how to resolve these would be
>>
>> highly appreaciated. See [2] for details.
>>
>>
>>
>> Last but not least there might be some opportunity to consolidate VM state
>>
>> handling, probably by reusing the one from PIIX3. Since I'm not very familiar
>>
>> with the requirements I didn't touch it so far.
>>
>>
>>
>> Testing done:
>>
>> * make check
>>
>> * make check-avocado
>>
>> * Boot live CD:
>>
>>   * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
>>
>>   * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
>>
>> * 'qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=ttyS0"`
>>
>>
>>
>> v3:
>>
>> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_USB_UHCIx (Philippe)
>>
>> - Make proxy PIC generic (Philippe)
>>
>> - Track Malta's PIIX dependencies through KConfig
>>
>> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits' series [3]
>>
>> - Also rebase onto latest master to resolve merge conflicts. This required copying
>>
>>   Philippe's series as first three patches - please ignore.
>>
> 
> Ping

Could you review patches 1-3?

