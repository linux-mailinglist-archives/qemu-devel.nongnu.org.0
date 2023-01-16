Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB33266C0B8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 15:04:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQ5M-0006O6-Ik; Mon, 16 Jan 2023 09:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pHQ4q-0006Be-Sy
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:03:12 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pHQ4p-0000gl-0v
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:03:08 -0500
Received: by mail-ed1-x52e.google.com with SMTP id m21so40834197edc.3
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 06:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=93YsE7iL+9pT8ZSYFYxutciSD97I4xp3G6YAY8FZgvM=;
 b=bcNmVUlOJElCAefFZ4N1nuOsPF56OlT0T+Z56J9OwdJHBPgzKNvDd/Trj/1Eg2N51Z
 L1eYruEp9rD/WfJbdOLkfez10rQPfT0H9Jh0AlrVedUPAHQz40qYnCXOWEsFUoxzMp/n
 yvpN9qC9U7e2ai9kaUxdAf2QGn709CV2aGwZJpTbHdrlJArvXhfOr6s9Oev+2azA7bd1
 Ka+dbLILscdFkF/p0A5Puhje0J3Kjua1lPUkFHQ4oumdbZbyyk0Z2F6aRricMld2+ldh
 wo0QWIKXuJGZ9jcUleEdIS51V5YTgPzVryyw44TCTMXNRMzSHlN8MXwVqkaimKFjt3pT
 jUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=93YsE7iL+9pT8ZSYFYxutciSD97I4xp3G6YAY8FZgvM=;
 b=IR3xfNYh8+h88MmFIjVZQOPH0LxLLEZZyTs2pM4C4PfDDDuA/JdITWlrdf9J9vhJym
 ocdigrllUPAVbdQuGh6i2r35tgGuH2Gz/f61s3pI28xg0a3vVMQZHLdBX57rKnZKJZLn
 XEbFllxAm/qZ3WDrbaW6jtoDHOw1zBtC02WSQfifP5zSpw/lJqWPrMqxWwSGwMxSV17+
 77FtYjOruZmOyO+XWaRWlEhf12ldlg12NyY2AeBWN/VHfQ/Tzyl8F6Rd1UTlDdb/lN7n
 ZiRyEXbutbG8iCHG1tnDz0pApbVz6J/CEsrzk/TEL822vEAMIb4Qljmy0/3YlASSoPgU
 84sg==
X-Gm-Message-State: AFqh2kryHxtQDuZy0L23RYLQdPNiId4YGTViMo93FoPLrpJoSUpD1PUh
 iM9l9p8ImVNHdBVw3wJuXSE=
X-Google-Smtp-Source: AMrXdXvjE9MBveDMzMAtvyFoqn6LbmCUqb7oFlFTHQq6XqHC+ofqoc0Buh8+TRX11k9BCJO6Y7v0Ig==
X-Received: by 2002:a50:fc14:0:b0:498:e0be:318b with SMTP id
 i20-20020a50fc14000000b00498e0be318bmr29629778edr.38.1673877785467; 
 Mon, 16 Jan 2023 06:03:05 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-143-217.77.191.pool.telefonica.de.
 [77.191.143.217]) by smtp.gmail.com with ESMTPSA id
 o7-20020aa7d3c7000000b0045bd14e241csm11574760edr.76.2023.01.16.06.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 06:03:05 -0800 (PST)
Date: Mon, 16 Jan 2023 14:02:55 +0000
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
In-Reply-To: <7ba3aa3e-9cb4-e092-9768-7b14da49f2b1@linaro.org>
References: <20230114222738.282478-1-shentey@gmail.com>
 <20230114222738.282478-7-shentey@gmail.com>
 <7ba3aa3e-9cb4-e092-9768-7b14da49f2b1@linaro.org>
Message-ID: <1136C54B-D813-48C0-A19B-5366D18454C2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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



Am 16=2E Januar 2023 09:14:28 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 14/1/23 23:27, Bernhard Beschow wrote:
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/i386/acpi-microvm=2Ec | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>
>Possibly squash with next patch, regardless:

Not sure how to name the patches then=2E Hm=2E=2E=2E

>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Thanks!

