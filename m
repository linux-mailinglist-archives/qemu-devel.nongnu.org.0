Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6FC434EB7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 17:11:24 +0200 (CEST)
Received: from localhost ([::1]:41314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdDFT-0000Q8-QD
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 11:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mdD9S-00039B-Kv
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 11:05:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mdD9Q-0007vo-Iw
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 11:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634742307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZEM6rYDofu5FzUiJHKRA4yX/hBTmYNPJvVHApHWM4s=;
 b=iN50iE537SS49fbS8UVKZV6wvFnBDkomym/epSDBrQu6YyVNVdOshkBS4xOadZfrhyHw0B
 Zh2fE65p/6Q66ASKWhmP1f3sVshwGioZSO2rJX7KoClhbzC4RnZjKsZJRp7iPY+i/fsqFi
 2gIal6vpqAr3GxeDGPs4CqvmsnQF7Yw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-EaAmGUr4P_KDzt44C9kNwA-1; Wed, 20 Oct 2021 11:05:03 -0400
X-MC-Unique: EaAmGUr4P_KDzt44C9kNwA-1
Received: by mail-ed1-f72.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so17819076edx.3
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 08:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QZEM6rYDofu5FzUiJHKRA4yX/hBTmYNPJvVHApHWM4s=;
 b=0YG1ut5pSHyEEiCWDcXYukvZU6uJjJM6KtOkZzKIh1MzAs+sfmREdke+MmvJzB680I
 O8UzVoqjKCIeKwzyKzUlua93p4d570EMvtDo9aAFR+WejSFt/1uOxr7OVV0wwOS9xTzy
 GAO8w78ShVOwGkI+cAXR+UKQxL00KQqnvOstW/1vO0JVvtCaiaUX8b+lu1R3xixEEME5
 +x1JyUiO/33WBB+rgzT4uFsbOoNn19xZRu+l/ukB20Q0BNOWEq5Miq3Z8pF3n8tZkKpk
 jtiDpYkPEl1USxjl24p8jDv3H7rioWrzdaVgIIMZYXB8YwTliUENG/idTVjweGfSTBG0
 IzPQ==
X-Gm-Message-State: AOAM531NJz/gOSjrp6tsfXCyA98iBOYm/mgr2gh1oQmtQi/9x5mSuPTy
 tmMaLOnJUW2Al4IbqjyxSnYsXh+Z/QiargkerbHLXyEbQwcGE/MtSsEp079sH1sffKfc1eWb3Uw
 nmKMeTuqUUy/Ffmk=
X-Received: by 2002:a17:906:c248:: with SMTP id
 bl8mr131162ejb.360.1634742302044; 
 Wed, 20 Oct 2021 08:05:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya/LIFRqqOUSo7Lmi4tFCFAzBuKiM0WFSBG+1eHkP4BZH0gU/AYXixT+oka4L8TMjs9TmZpw==
X-Received: by 2002:a17:906:c248:: with SMTP id
 bl8mr131052ejb.360.1634742301084; 
 Wed, 20 Oct 2021 08:05:01 -0700 (PDT)
Received: from thuth.remote.csb (tmo-097-184.customers.d1-online.com.
 [80.187.97.184])
 by smtp.gmail.com with ESMTPSA id ox9sm1157263ejb.66.2021.10.20.08.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 08:05:00 -0700 (PDT)
Subject: Re: Deprecate the ppc405 boards in QEMU?
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <5e4f78ce-1508-5689-ec29-79edad0c824e@kaod.org>
 <491d6265-3785-b11-b7f0-621a3d2823@eik.bme.hu>
 <b9f27c1b-1162-b178-9333-89c0dd707c12@redhat.com>
 <103e098a-a8ac-a22a-8aad-3df7d8cde148@amsat.org>
 <939f2d12-38f6-4ab0-b688-384136d1d9c@eik.bme.hu>
 <4e07823e-7162-525a-4a61-9bed63e85d58@kaod.org>
 <03d047aa-6d73-8697-ac43-29ab56563567@redhat.com>
 <942cf427-d052-5bd-6b66-ddc5a53fbec5@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <87acd22b-6288-16e5-aebf-03cf720873d3@redhat.com>
Date: Wed, 20 Oct 2021 17:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <942cf427-d052-5bd-6b66-ddc5a53fbec5@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, dbarboza@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/2021 16.55, BALATON Zoltan wrote:
> On Wed, 20 Oct 2021, Thomas Huth wrote:
>> On 20/10/2021 14.43, Cédric Le Goater wrote:
>>
>>> The 405 machine are still close to deprecation I think. We are still
>>> struggling to boot one with mainline Linux, using uboot provided by
>>> Thomas which skips SDRAM init. It is not clear to me if u-boot is
>>> strictly necessary. It depends if Linux relies on it to do some
>>> pre-initialization of HW. I guess once we find a good DTS for it, or
>>> not, we can take a decision.
>>
>> FWIW, seems like this tarball contains a dts for a "taihushui" 405ep board:
>>
>> https://dev.archive.openwrt.org/raw-attachment/ticket/4153/kolsch.tranzeo.openwrt.bsp.tar.bz2 
>>
>>
>> ... I wonder whether that's the same board as the "taihu" board in QEMU?
> 
> The corresponding ticket has some info on the machine:
> 
> https://dev.archive.openwrt.org/ticket/4153.html

Ok, so as far as I got that now, Taihu was a board by AMCC, while Taihushui 
was from Tranzeo ? ... so they were likely different boards, I think.

> I wonder what ref405ep was then, an earlier or later or different version?

According to hw/ppc/ppc405_boards.c, the ref405ep machine was a reference 
board by IBM, not from AMCC ?

  Thomas


