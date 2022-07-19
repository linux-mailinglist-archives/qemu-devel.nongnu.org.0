Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EF8579571
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:43:00 +0200 (CEST)
Received: from localhost ([::1]:50420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiol-0001Hy-S5
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDil5-0005VV-Hf
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDil2-0000VV-UP
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658219948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtUfJLpgJ8z08VTj1moUNgZ7z73MLiphaSLUVA5OpT0=;
 b=W9Zgl4rZGeiEg/FRarbXECwr/x7oVmfh69i34+JGSDJF5u/S+yo/hYTrjkJvhZ660WxXde
 JExwZUNbwHWKr1ODaUvSvmUF622gik3XM5PDZG8sS6+/5jqWxeJ+smYIOU8Jt1QBoNhqUO
 q+HjG7aZR5OPSUnZjCFhWyk0HJePWjw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-Wd87sU5lPM6io7adZAlMxQ-1; Tue, 19 Jul 2022 04:39:04 -0400
X-MC-Unique: Wd87sU5lPM6io7adZAlMxQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 ga9-20020a1709070c0900b0072b4d787f5dso2829029ejc.21
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qtUfJLpgJ8z08VTj1moUNgZ7z73MLiphaSLUVA5OpT0=;
 b=vqhz183f8G1mjBX4HtCWhpQewjz4H8FY28JdzyzCaZ5MskwET4MHh0VoOgJGtNAlyJ
 wj17qlI9N25Rzoy4TjnhHSYePagFs6OPRV+w3rVjsbasyWDar8YxE+3FeUgUxoBDjrrz
 w3P+R4IZbgiHvNNJT6D8hRqFvMFwIiRevm8VetPya4RK4vKPFEUefosqgem73vlNnMFt
 JSzpnj0idrQeln/DIDrPrIebrV/HC4TaeNOglpr08tKXiRRfIv4RwWEgrLQ1ahgcpGXo
 joIO8cFEaamWksDFrYISx6xIoRlcFCXmVj4oPhleuewa0iryzSqAtSGuyHFfaMpoDpmp
 Q2Gw==
X-Gm-Message-State: AJIora/egx5Prfyzr9iRj1Bd/0SOLwoJ1PsmIdE80LsxLFXxdLdRPeXP
 pxQOH9ZvLXCvPstslrkx2G8ag3v9FwXIOI1Sgs/WQ6N7owBCpt5oJiGKx6dDeUMnUxMw+rVuVLV
 W9yeWH19nikW/9Io=
X-Received: by 2002:a05:6402:5114:b0:43a:d072:83b9 with SMTP id
 m20-20020a056402511400b0043ad07283b9mr43305621edd.260.1658219943182; 
 Tue, 19 Jul 2022 01:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s163rSgNTwpLorTsbHi0aHVSQB1kN+nLDmTBgRb9CtNqyThgCZbgl0TXBkcNzoD45cdVF5Mw==
X-Received: by 2002:a05:6402:5114:b0:43a:d072:83b9 with SMTP id
 m20-20020a056402511400b0043ad07283b9mr43305593edd.260.1658219942958; 
 Tue, 19 Jul 2022 01:39:02 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 24-20020a170906329800b006fecf74395bsm6512369ejw.8.2022.07.19.01.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 01:38:58 -0700 (PDT)
Date: Tue, 19 Jul 2022 10:38:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: Re: [PATCH v3 1/5] target/loongarch/cpu: Fix cpu_class_by_name
 function
Message-ID: <20220719103857.1c5d11de@redhat.com>
In-Reply-To: <04aa029a-0415-e902-cd3d-399b358e0aa5@linaro.org>
References: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
 <20220715060740.1500628-2-yangxiaojuan@loongson.cn>
 <a36bbd80-f830-51bd-5aac-b430572259d3@linaro.org>
 <04aa029a-0415-e902-cd3d-399b358e0aa5@linaro.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 19 Jul 2022 12:22:14 +0530
Richard Henderson <richard.henderson@linaro.org> wrote:

> On 7/19/22 12:16, Richard Henderson wrote:
> > On 7/15/22 11:37, Xiaojuan Yang wrote: =20
> >> In loongarch_cpu_class_by_name(char *cpu_model) function,
> >> the argument cpu_model already has the suffix '-loongarch-cpu',
> >> so we should remove the LOONGARCH_CPU_TYPE_NAME(cpu_model) macro.
> >> And add the assertion that 'cpu_model' resolves to a class of the
> >> appropriate type.
> >>
> >> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org> =20
> >=20
> > This patch causes tests to fail, e.g.
> >=20
> >  =C2=A0 TEST=C2=A0=C2=A0=C2=A0 float_convd on loongarch64
> >=20
> > qemu-loongarch64: unable to find CPU model 'la464'
> >=20
> > make[1]: *** [/home/rth/qemu/src/tests/tcg/multiarch/Makefile.target:29=
: run-float_convd]=20
> > Error 1
> >=20
> >=20
> > What caused you assume that all cpu models are already suffixed? =20
>=20
> Mm.  I suppose the use over in hw/loongarch/loongson3.c.
> I will make this function match target/alpha/cpu.c, which checks cpu_mode=
l as-is, and then=20
> tries again with the suffix.

if we think about adding hotplug/qmp/-device support for CPUs in future,
those interface operate with type-names directly without any pre-processing=
 whatsoever.

so I'd very much prefer just as-is (i.e. direct type-name matching)
(all other model parsing usually comes from legacy code)

>=20
>=20
> r~
>=20


