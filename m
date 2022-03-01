Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCC44C9514
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:52:09 +0100 (CET)
Received: from localhost ([::1]:43448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8XX-0003z6-UX
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:52:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nP83k-0004ME-Of
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:21:25 -0500
Received: from [2a00:1450:4864:20::433] (port=46787
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nP83R-0003tT-Gk
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:21:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id e10so4508470wro.13
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 11:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Vl0jjpweCtcLiIvxs3KZt8ZqIEeBbonF3/sJrPoyJ4k=;
 b=RhPuWbtXHDNyqxW0lgAkk38H9Dla5liISPzLdPp/aqnKJAq7UmOs2ruC5hSxWNjCiq
 DGmLOEKTFHCYFbJxw+Ut45jDsDkbjct8BmvpcPDvNLPcoF0nNmTM0gRJ8blRWMxxhwtQ
 gAYdUOxvHXmSfLICEZH9HIgxQW0EedplX5sohLQes1784xAH3CH8Qg7H9L4a/OtY15LD
 tyw1xWOK4yFVdeuSKtFnOOjo22oCI9G36qggr2oZaP/cq++htkLDqy3fkZ40V8EmJQtZ
 dCsFPPmJkQsQWlxNEPnhFnLK91Riuz7nTSW8s8wbPB+XOMu4NifX8gsX29pyOq42d8Xi
 3ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vl0jjpweCtcLiIvxs3KZt8ZqIEeBbonF3/sJrPoyJ4k=;
 b=2Qmz+xul7qqecqNHDG/b0xZHdJePbG/pd+jGMuO706uBFvDl+pmCMAzas7zRfLRKzY
 +ItLKweqhEBDQVirwPquPE6o6yGJ38Qfxi86g8Nk07V4QSrOMYFTzqZG85ZIAYzN58HT
 J9yuN5TbE6dEgrPimsO4u3/mMaVIFy+DN8J9rOAG1ZUolThU+Zv2iAy/u+JErCHkAtgg
 /NaFTIe5x4y45mdKrlZt9BIO62lY5bhnNtDxHEtWduM/BkhuMov7dvwrhD7cU8ZQcvm5
 eqvMd0Mi2jhl1mDTV/GSXiIyNsdoTsx+8YL4ofk4kLvKdxsygIGY8o2Wem3pl4OtV47/
 dX/w==
X-Gm-Message-State: AOAM531q9Wr6fusioMFUzE7ybQDlBwicIko7WV4bDaXfo05MBhjlrPbZ
 wbMGPz52SATMgvjQ2Fs+PrU=
X-Google-Smtp-Source: ABdhPJxys+l9M98/9I5iVtDE6QglQpj5Z/hp75Dz2ELS2KyDqHEYlZJGpZWhPCfeAVuhgykeAakybw==
X-Received: by 2002:a5d:4ccd:0:b0:1ed:a139:708f with SMTP id
 c13-20020a5d4ccd000000b001eda139708fmr20129507wrt.672.1646162459217; 
 Tue, 01 Mar 2022 11:20:59 -0800 (PST)
Received: from ?IPV6:2a10:800b:ea29:1:266:a58e:9f87:7014?
 ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 f186-20020a1c38c3000000b00382a9b91515sm1315251wma.37.2022.03.01.11.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 11:20:58 -0800 (PST)
Message-ID: <3face56c-7488-6736-6394-af1d9979d00f@gmail.com>
Date: Tue, 1 Mar 2022 21:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
 <alpine.DEB.2.22.394.2203011514030.1522204@anisinha-lenovo>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2203011514030.1522204@anisinha-lenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: shentey@gmail.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/1/22 11:52, Ani Sinha wrote:
>
> On Tue, 1 Mar 2022, Igor Mammedov wrote:
>
>> On Mon, 28 Feb 2022 22:17:32 +0200
>> Liav Albani <liavalb@gmail.com> wrote:
>>
>>> This can allow the guest OS to determine more easily if i8042 controller
>>> is present in the system or not, so it doesn't need to do probing of the
>>> controller, but just initialize it immediately, before enumerating the
>>> ACPI AML namespace.
>>>
>>> This change only applies to the x86/q35 machine type, as it uses FACP
>>> ACPI table with revision higher than 1, which should implement at least
>>> ACPI 2.0 features within the table, hence it can also set the IA-PC boot
>>> flags register according to the ACPI 2.0 specification.
>>>
>>> Signed-off-by: Liav Albani <liavalb@gmail.com>
>>> ---
>>>   hw/acpi/aml-build.c         | 11 ++++++++++-
>>>   hw/i386/acpi-build.c        |  9 +++++++++
>>>   hw/i386/acpi-microvm.c      |  9 +++++++++
>> commit message says it's q35 specific, so wy it touched microvm anc piix4?
> Igor is correct. Although I see that currently there are no 8042 devices
> for microvms, maybe we should be conservative and add the code to detect
> the device anyway. In that case, the change could affect microvms too when
> such devices get added in the future.
>
>
> echo -e "info qtree\r\nquit\r\n" | ./qemu-system-x86_64 -machine microvm
> -monitor stdio 2>/dev/null | grep 8042
>
> <empty>

What about this?

echo -e "info qtree\r\nquit\r\n" | qemu-system-x86_64 -machine microvm 
-device i8042 -monitor stdio 2>/dev/null | grep 8042

Or this?

echo -e "info mtree\r\nquit\r\n" | qemu-system-x86_64 -machine microvm 
-device i8042 -monitor stdio 2>/dev/null | grep 8042

>

