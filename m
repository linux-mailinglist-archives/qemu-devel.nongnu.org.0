Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9183679FC8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 18:08:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKMlu-0001R1-Ct; Tue, 24 Jan 2023 12:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pKMls-0001Pd-E2
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 12:07:44 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pKMlq-0004Gh-MA
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 12:07:44 -0500
Received: by mail-ej1-x62b.google.com with SMTP id mp20so40757159ejc.7
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 09:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4IXISPY5stzync/KUBvKXq0ONfLxyCKnySoOrUOcUuM=;
 b=OFfSeCBodDaa0PquypwkxlnGdqhgExe5Tqmdj54i0tKDCWz5KEbPbM+YhL4kagRWq0
 pLVThJ/3Z2B1f48k/uj1IbPmGaJv27zzbXeeDPITp4wZyJTVHUQdz6hOum32x1CKch4E
 X6imBIQHUYKHD40TqI2rhvWI4U4vzqudSzI/NMwFeisI35VGGlvK431L7XDyiR8cZTNU
 7jbKBs0cFwZhmkHyjsDk18aaPvX6HZfR4xNJDfRCXWYobNMmW3fo/iSO/YpDwkI+GRtQ
 j+8NDATKZBMIsOvPkZGoZ/bb+SXNlE1kbGlSX1eeYRN/yJE9iIFLMKEiA+StjVABdV+s
 9LcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4IXISPY5stzync/KUBvKXq0ONfLxyCKnySoOrUOcUuM=;
 b=xRLJeOn8Var1/3fnTMKST3Q7sOMQ3D065xpSBst9TnmdS4soJyR3lV+hYKlwZxZ40Q
 Q8OeQapznGevEGZEgob+LCV5Eigp+O0a2UygvQw2spK8CzK2WvBNB2TGFH25O8h9GIBu
 SaXcNOXV9WH0xgyjxv5ZpLaAt0Nl/ktBZCuk+3+5lcP1cTOimNGyuaxuexgonzw/uZlG
 Cm0nfhHoTDito6h1zPRHCMdFQkOsx8hMLlLovpnH59WS/K984s8MljtfR5mrQXUEoyMW
 H1bcrLvrvwSToYi09T9ZbIV/7+U9IDBr8Qx1dhsohGOjBgugcitZuOnrZjFIcX7YCsdF
 cx7g==
X-Gm-Message-State: AFqh2kqX3EGQLtR8pEiN9h13bTpkH4FJe2ALCGtBzPqd5mR18S7D6AhP
 IoC8s9GtkYfkDy83RkLIkmU=
X-Google-Smtp-Source: AMrXdXuxMXeA+QJHu7+lnoisAh5OXs04+/6pXredGjOy405Q3BgjsuIdIBcKce8ALFJUS3/FmbgIqA==
X-Received: by 2002:a17:906:3783:b0:86f:e116:295 with SMTP id
 n3-20020a170906378300b0086fe1160295mr34112197ejc.4.1674580060813; 
 Tue, 24 Jan 2023 09:07:40 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb2007c8246afca181621.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:7c82:46af:ca18:1621])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a17090637d900b008536ff0bb44sm1150293ejc.109.2023.01.24.09.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 09:07:40 -0800 (PST)
Date: Tue, 24 Jan 2023 17:07:30 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <Y9ADQ/Yu8QQD0oyD@perard.uk.xensource.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230118051230-mutt-send-email-mst@kernel.org>
 <Y9ADQ/Yu8QQD0oyD@perard.uk.xensource.com>
Message-ID: <0C2B1FE4-BB48-4C38-9161-6569BA1D6226@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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



Am 24=2E Januar 2023 16:11:47 UTC schrieb Anthony PERARD <anthony=2Eperard=
@citrix=2Ecom>:
>On Wed, Jan 18, 2023 at 05:13:03AM -0500, Michael S=2E Tsirkin wrote:
>> On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote:
>> > This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally=
 removes
>> > it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ to make X=
en in the PC
>> > machine agnostic to the precise southbridge being used=2E 2/ will bec=
ome
>> > particularily interesting once PIIX4 becomes usable in the PC machine=
, avoiding
>> > the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>>=20
>> Looks ok to me=2E
>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>>=20
>> Feel free to merge through Xen tree=2E
>
>Hi Bernhard,

Hi Anthony,

>The series currently doesn't apply on master=2E And a quick try at
>applying the series it is based on also failed=2E Could you rebase it , o=
r
>maybe you would prefer to wait until the other series "Consolidate
>PIIX=2E=2E=2E" is fully applied?

Thanks for looking into it!

You can get the compilable series from https://patchew=2Eorg/QEMU/20230104=
144437=2E27479-1-shentey@gmail=2Ecom/ =2E If it doesn't work for you let me=
 know, then I can rebase onto master=2E All necessary dependencies for the =
series are upstreamed meanwhile=2E

Thanks,
Bernhard
>
>Thanks=2E
>
>> > Testing done:
>> > None, because I don't know how to conduct this properly :(
>> >=20
>> > Based-on: <20221221170003=2E2929-1-shentey@gmail=2Ecom>
>> >           "[PATCH v4 00/30] Consolidate PIIX south bridges"
>

