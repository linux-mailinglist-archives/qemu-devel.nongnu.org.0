Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BE252A50F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:38:03 +0200 (CEST)
Received: from localhost ([::1]:43802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyKo-0008U5-Fy
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nqyDa-0006z9-Ae
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:30:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nqyDV-0008Mj-G4
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652797828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wjd9eIQ1J/UJozV9sNU1/pXieg82Cyb2jQNajCtBdj8=;
 b=Qcnx0G6hVTucp4XG02yPuCYRPCNEmFjibsSfcfFec/6vrRn+MbYcXBVIxPg5C1O+7qsU6z
 pQCJpxzS78HLlTaasLPBSoHDoiqkSJwl6k9V2FrveM/Lg4K+K+dLESZUUtubWx81GbgmWS
 oE/41kzDa7kp/OAWOGSWSCfdSJx+4Do=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283--6LWDgyMPdOKvxmbGMv4Mg-1; Tue, 17 May 2022 10:30:26 -0400
X-MC-Unique: -6LWDgyMPdOKvxmbGMv4Mg-1
Received: by mail-wr1-f69.google.com with SMTP id
 e2-20020a5d65c2000000b0020d266653eeso798416wrw.7
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 07:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=Wjd9eIQ1J/UJozV9sNU1/pXieg82Cyb2jQNajCtBdj8=;
 b=xs9f3CoUNZEgNyB2yTYDLlJkT3xm+HwFXuJ6bqVGGvgoZudgoLBvFIW6M4pJ9zqVIH
 zVVoVXFq51yIq6UIM+4YYY9aGfrOGOIeDWc9RCG4unG8uEc15d//6pFTXswNRICUDjqp
 c/whgXzhqtoR1PzSPzkw2gFkmTkzcVtUifBHQKiWPl24OU1bsr6w1qHvmokJmsCEck/G
 GZih6EBfI4U+xkCMkva1/Lfv/hTiz+qVpdAeQ+YySkG2WvNxoy8RlxrSUBQnPqRl99JH
 hBpaHMM/llFX7++jqoL3dA24l9OLGxgxQuFNxA4XQUyVePwvNerL0Pl8X41X0IJ8RKyu
 7F2g==
X-Gm-Message-State: AOAM530G0j978xJcTRsRHR8HcvXat8JOyco0xAslP9DdM+/uUuUnaTNF
 ZlQN2GoHZoXCybFPgE+5sUJVq5OVt9/DtA5mm1N+P0OkaP/ALqv6ywfB4xF8Gbo6kxht7BFrZZi
 lNqjQqGskfa7rgjg=
X-Received: by 2002:a5d:554a:0:b0:20d:544:a3c9 with SMTP id
 g10-20020a5d554a000000b0020d0544a3c9mr10479591wrw.699.1652797825325; 
 Tue, 17 May 2022 07:30:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmlkxw2GKJuc9JiQVlmRAFB7MZw0mY27GmOoQEGC00FZaGu0wf1kPxV4Zi+DzXk2fR4fDERQ==
X-Received: by 2002:a5d:554a:0:b0:20d:544:a3c9 with SMTP id
 g10-20020a5d554a000000b0020d0544a3c9mr10479574wrw.699.1652797825076; 
 Tue, 17 May 2022 07:30:25 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:1d02:ba00:f4f8:7394:c8:7ddf?
 ([2a0c:5a80:1d02:ba00:f4f8:7394:c8:7ddf])
 by smtp.gmail.com with ESMTPSA id
 ay34-20020a05600c1e2200b003942a244f54sm2471996wmb.45.2022.05.17.07.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 07:30:24 -0700 (PDT)
Message-ID: <60bbb634af7bac008f0d96995d5ca1b48c779c7c.camel@redhat.com>
Subject: Re: [PATCH v3 0/3] thread-pool: fix performance regression
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Date: Tue, 17 May 2022 16:30:23 +0200
In-Reply-To: <20220514065012.1149539-1-pbonzini@redhat.com>
References: <20220514065012.1149539-1-pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sat, 2022-05-14 at 08:50 +0200, Paolo Bonzini wrote:
> Together, these two patches fix the performance regression induced by
> QemuSemaphore; individually they don't though.
>=20
> The third patch is a small cleanup on top, that was enabled by the
> recent introduction of min_threads/max_threads knobs for the
> thread pool.
>=20
> 6.2:
>    iops        : min=3D58051, max=3D62260, avg=3D60282.57, stdev=3D1081.1=
8, samples=3D30
>     clat percentiles (usec):   1.00th=3D[  490],   99.99th=3D[  775]
>    iops        : min=3D59401, max=3D61290, avg=3D60651.27, stdev=3D468.24=
, samples=3D30
>     clat percentiles (usec):   1.00th=3D[  490],   99.99th=3D[  717]
>    iops        : min=3D59583, max=3D60816, avg=3D60353.43, stdev=3D282.69=
, samples=3D30
>     clat percentiles (usec):   1.00th=3D[  490],   99.99th=3D[  701]
>    iops        : min=3D58099, max=3D60713, avg=3D59739.53, stdev=3D755.49=
, samples=3D30
>     clat percentiles (usec):   1.00th=3D[  494],   99.99th=3D[  717]
> =09
> patched:
>    iops        : min=3D60616, max=3D62522, avg=3D61654.37, stdev=3D555.67=
, samples=3D30
>     clat percentiles (usec):   1.00th=3D[  474],   99.99th=3D[ 1303]
>    iops        : min=3D61841, max=3D63600, avg=3D62878.47, stdev=3D442.40=
, samples=3D30
>     clat percentiles (usec):   1.00th=3D[  465],   99.99th=3D[  685]
>    iops        : min=3D62976, max=3D63910, avg=3D63531.60, stdev=3D261.05=
, samples=3D30
>     clat percentiles (usec):   1.00th=3D[  461],   99.99th=3D[  693]
>    iops        : min=3D60803, max=3D63623, avg=3D62653.37, stdev=3D808.76=
, samples=3D30
>     clat percentiles (usec):   1.00th=3D[  465],   99.99th=3D[  685]
> =09
> Paolo
>=20
> v1->v2: support min_threads/max_threads
>=20
> v2->v3: fix NULL pointer dereference [Nicolas]
>=20
> Paolo Bonzini (3):
>   thread-pool: optimize scheduling of completion bottom half
>   thread-pool: replace semaphore with condition variable
>   thread-pool: remove stopping variable
>=20
>  util/thread-pool.c | 74 +++++++++++++++++++---------------------------
>  1 file changed, 30 insertions(+), 44 deletions(-)


For the whole series:

Reviewed-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>

Thanks,

--=20
Nicol=C3=A1s S=C3=A1enz


