Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA4153722D
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 20:33:03 +0200 (CEST)
Received: from localhost ([::1]:45438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvNin-0002k6-T2
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 14:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nvNhI-0000gQ-8g
 for qemu-devel@nongnu.org; Sun, 29 May 2022 14:31:28 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nvNhG-0000nx-Hc
 for qemu-devel@nongnu.org; Sun, 29 May 2022 14:31:27 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g20so10985526edj.10
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:in-reply-to:references:message-id:mime-version
 :content-transfer-encoding;
 bh=CBRk5pj/b8+jDesSXGqSdsFh95vyVhXcRLGMwys9PFw=;
 b=LY9s/DvAT9AR+9YcxCe5egOh3+xViDB8W+3MiPSkgNbdDD2XYSfKXzPnnqkZfoe3lz
 a1gaSFVtOhH7cxnar+N6RozZnpRkhLQaw7r3VDATuGOnjFRJCO8LFW0LDk9fdzqLIxw5
 iPrk7y2MINuphK53sl0Rp6CIv84oVAdiaTCpOiUxKHRJWeQ+Z/1X+f32ETuSmOHvXptT
 YM8vPaZkV3LsHKD3IRF5IW/OI7ElY0cWBRqIErBfDkyb1OvJyUkg+ZYYiHW4JrS+/70E
 iLxZI5jcez8eCd1Okcp/0145zqixdgWpwVCJ6n1g4zT850j1fBnGoAyD6mcwv9zGltpy
 q+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=CBRk5pj/b8+jDesSXGqSdsFh95vyVhXcRLGMwys9PFw=;
 b=T0MKyafj0DycxjhfmyBc4rFXs0qi0wfzMJnMAqo6XXRamZ27AZ2img93jg2xgHO9L4
 RMoc9Be48nVloaeHtXoJnkt4oNrv8WCqND5hCjx0Wvis9OjloJ5UbvX2moZ85Z40mj2j
 M9ffPyvvnBCMPR6V3PstO2kbcQfhPethiGqaZKVKD0kpALUZVtVuTRlIvypTYRJCV7x2
 9DXPkA+5OmHop837KMXGjnv/wX5IqMACwYdd3Fiy47Hr78b368TQI2xsV8H2KTS7xpXH
 hnv1BZ2eyLhC/X2HDo/cLjiPZWkTWP2ol10iFyvUMPkVzTg/pO0nHmqJOKvdWTJhvDNk
 WMOg==
X-Gm-Message-State: AOAM531A3jGQM3BoG40JICrSL6G7ww5T4Derp1Roa5jY83WE7o/a1jco
 ctef+9q2NXe5PRi9i/48PCU=
X-Google-Smtp-Source: ABdhPJwWoODq1uHcpujBfG4dMFNzRe/qOq9J/pKKcJo+rwUQ4NbL2W/7g2rGML4ZEhPIDGb5+eFdXA==
X-Received: by 2002:a05:6402:2694:b0:42b:251d:185 with SMTP id
 w20-20020a056402269400b0042b251d0185mr48204587edd.44.1653849084974; 
 Sun, 29 May 2022 11:31:24 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf303d00154dd35d8bf95fb4.dip0.t-ipconnect.de.
 [2003:fa:af30:3d00:154d:d35d:8bf9:5fb4])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a170906304b00b006f3ef214e63sm3349767ejd.201.2022.05.29.11.31.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 May 2022 11:31:24 -0700 (PDT)
Date: Sun, 29 May 2022 18:31:21 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, mst@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_00/12=5D_hw/acpi/piix4=3A_re?=
 =?US-ASCII?Q?move_legacy_piix4=5Fpm=5Finit=28=29_function?=
In-Reply-To: <d56db423-6d8f-d2ca-c91b-d098ed9f4549@amsat.org>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
 <d56db423-6d8f-d2ca-c91b-d098ed9f4549@amsat.org>
Message-ID: <E07C8017-374B-4B4A-8902-074E50D0B1AA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29=2E Mai 2022 18:05:41 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <f4bug=
@amsat=2Eorg>:
>On 28/5/22 11:19, Mark Cave-Ayland wrote:
>> Whilst reviewing Bernhard's PIIX Southbridge QOMifcation patches at
>> https://lists=2Egnu=2Eorg/archive/html/qemu-devel/2022-05/msg04329=2Eht=
ml, I
>> noticed that we should first eliminate the legacy device init function
>> piix4_pm_init()=2E
>>=20
>> This series moves the outstanding logic from piix4_pm_init() into the
>> relevant instance init() and realize() functions, changes the IRQs to
>> use qdev gpios, and then finally removes the now-unused piix4_pm_initfn=
()
>> function=2E
>>=20
>> Signed-off-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>
>>=20
>>=20
>> Mark Cave-Ayland (12):
>>    hw/acpi/piix4: move xen_enabled() logic from piix4_pm_init() to
>>      piix4_pm_realize()
>>    hw/acpi/piix4: change smm_enabled from int to bool
>>    hw/acpi/piix4: convert smm_enabled bool to qdev property
>>    hw/acpi/piix4: move PIIX4PMState into separate piix4=2Eh header
>>    hw/acpi/piix4: alter piix4_pm_init() to return PIIX4PMState
>>    hw/acpi/piix4: rename piix4_pm_init() to piix4_pm_initfn()
>>    hw/acpi/piix4: introduce piix4_pm_init() instance init function
>>    hw/acpi/piix4: use qdev gpio to wire up sci_irq
>>    hw/acpi/piix4: use qdev gpio to wire up smi_irq
>>    hw/i386/pc_piix: create PIIX4_PM device directly instead of using
>>      piix4_pm_initfn()
>>    hw/isa/piix4=2Ec: create PIIX4_PM device directly instead of using
>>      piix4_pm_initfn()
>>    hw/acpi/piix4: remove unused piix4_pm_initfn() function
>
>Nitpicking, SCI could also be a named GPIO :)

Yes=2E=2E=2E I was just wondering the same!

Best regards,
Bernhard

>
>Series:
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>


