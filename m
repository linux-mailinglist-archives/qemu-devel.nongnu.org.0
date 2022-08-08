Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F7558CFCD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 23:39:11 +0200 (CEST)
Received: from localhost ([::1]:33056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLASs-0004pG-VA
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 17:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oLAIm-0006ni-B1
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:28:44 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oLAIk-0000le-Rl
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:28:44 -0400
Received: by mail-ej1-x629.google.com with SMTP id kb8so18937350ejc.4
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 14:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=SLorzHLI8SmOP6GkRqaxkVMfDJyL7mmMhxA5BBXWNPM=;
 b=MmWKR08A5XHnJ6hW9VGlv+0VtpeuRVJhbI/Pjn2MyS1AalpOjuD31DnL4mIls4M/Dm
 JwFzZ1XZWs05cgjtjz/pSrBed5yYIpKWkJrGMK1gMAkivhwy2CUHLWhyYlxFi9uCf7QE
 Nm0Hj4KM0kkZVumiefvwqLMqt/xjAa+uRAojlCLN115bcFMp6MPLlVnNlKwz+umKX+ey
 sx1p+BVWMp4LlREy3NN/QFOLHhfVTMsp7qSZKt9gix7iW12reO3ozRz0P85fD5oZCnlB
 RMDNY02+tjNP34hwEYHUtU8oGMYapJJQdQe+UdJ7zuwzxxNmNeDqwZF6HAPUVLPD0GpL
 qmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=SLorzHLI8SmOP6GkRqaxkVMfDJyL7mmMhxA5BBXWNPM=;
 b=G1kf96plrLyrpQMqjaiFEambbFBYimlEIBSqm0OrIp+Rh4uTDDUdr76Af6YW8YFeHS
 34bbq++jBx167JvbRAZz7eHB9ZtIa3fVX8Rm+h6Izp/5PlHlRcRy+zVi6PzlJ/vkrSg+
 z1rBtvvkIn7rdFjq+PWAyupmdqXIFJuZpEvc8d6c32JVNKqFU0V5rbr9T+8MlPnFA6SL
 YacT35hwnZehIJgJmtxkLBMSnAynsNuILAvT0YsPSv3zawdiVRQ892QWMYKu2Pnmz2Xd
 /zM2OZaJHnqQ+pwQhFLI72JP6Z9Wn6nvgn7W0P/I3Jnog5btXa3PwkAjaExoWYrGENj5
 wK7Q==
X-Gm-Message-State: ACgBeo1LzfP3tXESLqMsIgdyz98Hgd8VF32w8wx6kV5x6WssdHnOr701
 Qesw3Pr++3XUiGME+rSL0KM=
X-Google-Smtp-Source: AA6agR6Nxc61+fzvfM35kELeqWR8Kj7u3diyvwiImMHwFrclI+7HVvO0UqHOH+3vgZUol2FVM6wlDw==
X-Received: by 2002:a17:907:60c7:b0:731:4b42:4e3e with SMTP id
 hv7-20020a17090760c700b007314b424e3emr6085363ejc.236.1659994120181; 
 Mon, 08 Aug 2022 14:28:40 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-176-010.89.14.pool.telefonica.de.
 [89.14.176.10]) by smtp.gmail.com with ESMTPSA id
 kv21-20020a17090778d500b0072b8fbc9be1sm286227ejc.187.2022.08.08.14.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 14:28:39 -0700 (PDT)
Date: Mon, 08 Aug 2022 23:28:34 +0200
From: BB <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: Igor Mammedov <imammedo@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Ani Sinha <ani@anisinha.ca>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_for-7=2E1=5D_hw/mips/malta=3A_tur?=
 =?US-ASCII?Q?n_off_x86_specific_features_of_PIIX4=5FPM?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFEAcA_m-8j-v-X2ZhpOPpAC=SkSKwz6_tNaORzSi0wfx-7xLQ@mail.gmail.com>
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
 <20220728151627.119d57d5@redhat.com>
 <769cfc18-9585-5ddf-de46-52aa64328cea@amsat.org>
 <CAG4p6K53y=Oe9vynXgGYTZ9CfHewsDeE3mFDkEb-_us7rgaBcg@mail.gmail.com>
 <20220808141540.317e018e@redhat.com>
 <E4A796B6-AA0E-4266-8698-E894A51A7807@gmail.com>
 <CAFEAcA_m-8j-v-X2ZhpOPpAC=SkSKwz6_tNaORzSi0wfx-7xLQ@mail.gmail.com>
Message-ID: <8ECB91D1-43B7-4085-B98E-F44FF677D5AF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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



Am 8=2E August 2022 20:02:50 MESZ schrieb Peter Maydell <peter=2Emaydell@l=
inaro=2Eorg>:
>On Mon, 8 Aug 2022 at 18:57, BB <shentey@gmail=2Ecom> wrote:
>> Am 8=2E August 2022 14:15:40 MESZ schrieb Igor Mammedov <imammedo@redha=
t=2Ecom>:
>> >On Wed, 3 Aug 2022 19:26:30 +0200
>> >While refactoring we should keep migration stream compatible with olde=
r
>> >QEMU versions (we must not regress widely x86 code path)=2E Which migh=
t be
>> >tricky in this case=2E
>>
>> Does this particular fix make future compatibility harder or easier or =
is it that hard already? IIUC it omits the hotplug bits in the vm state for=
 Malta which is what one would expect there, right?
>
>This patch's fix only affects Malta=2E It is (I suspect but have
>not tested) a migration compat break on Malta, but we don't
>care about cross-version migration compat for that board anyway=2E
>Migration compat matters (to a first approximation) only for
>those boards which have versioned machine types (eg pc-7=2E0,
>pc-7=2E1, etc)=2E For all other machine types we retain compat
>only if it's easy=2E

I see=2E Thanks for the clarification!

Best regards,
Bernhard
>
>thanks
>-- PMM

