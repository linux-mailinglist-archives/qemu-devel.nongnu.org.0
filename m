Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16666C214
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 15:20:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQKf-0006W3-Fz; Mon, 16 Jan 2023 09:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pHQKe-0006Uq-4C
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:19:28 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pHQKa-0003dH-EG
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:19:25 -0500
Received: by mail-ej1-x62d.google.com with SMTP id ss4so61165417ejb.11
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 06:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jOapUUdZ4I52rbq42XTmxY6nVUewEypTAbVxanRxaeM=;
 b=qzFa8qMA6I4jsAaWy0RYeI99d6oOYtBCSAu5exnUpurW7jcMAp4IvuSexUF75GGw8l
 R+GyiDeRmwJUMCmgA+g490GdKDhPPgKIxt7ZtfqO0wlC82D96Q8DKahE95iQg9/X1wBv
 8dUMYFtNZKfjKWB2AQ3Z+INskMssjNxsd+SY9I/e1zVKyVAY5fj7iO+Bsx5iFa4nmUqD
 HVZXOP3SI68j1Yirz9lCeYS2vUe4NY1kbK56xBoZWImihnr0Z3WV/aT7pKYKX8B1YLlB
 QracXr4uHr+VNXKzILHCAj3UNMu2Cjk7OHsMo3bGBziKVIr8wxDWsz/ihk1O1xYlWIH3
 HJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jOapUUdZ4I52rbq42XTmxY6nVUewEypTAbVxanRxaeM=;
 b=TRKUdQi5t4Ft/ls4Qgo++SUgTOgbbQqOBt11zol+zVG/34KSBpTwJCthFYptspuJtd
 RC2xMt4v4TpzIYFYhh74znB2i4KPSr9osDbUI31dGEP0Pfhcag7M/vO2gh38Nw/LN29k
 u7Fc8mqD4gXEuoGh9tb4QCfnbi9pFEOrcjcaaYlCOjBjPT3TywyO6YsfDX+/ILaeRlJZ
 S1A0zK7bwu8BBpvApU5p4aS1dwn99uXJxLaDBltG5YY2rY+RrM1W9Ubqe2KQLjvI/+zH
 idw6+cIAnxPd7xoqiouzms3bv8M4LDL7z7oTAp1DEbYIA2NSNTgBQ5BLqXNu0aGZcuK5
 a+PQ==
X-Gm-Message-State: AFqh2kpJArTBY5tQDTXnNqOj+4WFAATAGRpKD7G+46k5TY/P2f9yk0h8
 9g0m96MnMrrhMz2O1uW73d4=
X-Google-Smtp-Source: AMrXdXujmO0sc9zIiD50ybpW1K53TVT5uVaxBeggdBxyxsvndbwahvhhjvW0IWpIfJ7IbOqa/E4YAA==
X-Received: by 2002:a17:906:c01a:b0:86f:ed46:c07f with SMTP id
 e26-20020a170906c01a00b0086fed46c07fmr5212656ejz.75.1673878762801; 
 Mon, 16 Jan 2023 06:19:22 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-143-217.77.191.pool.telefonica.de.
 [77.191.143.217]) by smtp.gmail.com with ESMTPSA id
 kw17-20020a170907771100b0084c4b87aa18sm11936862ejc.37.2023.01.16.06.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 06:19:22 -0800 (PST)
Date: Mon, 16 Jan 2023 14:18:44 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 6/7] hw/i386/acpi-microvm: Reuse qbus_build_aml()
In-Reply-To: <1136C54B-D813-48C0-A19B-5366D18454C2@gmail.com>
References: <20230114222738.282478-1-shentey@gmail.com>
 <20230114222738.282478-7-shentey@gmail.com>
 <7ba3aa3e-9cb4-e092-9768-7b14da49f2b1@linaro.org>
 <1136C54B-D813-48C0-A19B-5366D18454C2@gmail.com>
Message-ID: <8F643594-4594-493D-BBE7-CB280A485B5A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 16=2E Januar 2023 14:02:55 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 16=2E Januar 2023 09:14:28 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>>On 14/1/23 23:27, Bernhard Beschow wrote:
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> ---
>>>   hw/i386/acpi-microvm=2Ec | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>>Possibly squash with next patch, regardless:
>
>Not sure how to name the patches then=2E Hm=2E=2E=2E

I could first move and rename isa_build_aml()=2E I think that'll be cleane=
r and avoids two functions doing the same temporarily=2E

>
>>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>
>Thanks!

