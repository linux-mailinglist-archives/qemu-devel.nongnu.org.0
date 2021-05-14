Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFE5380F2D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:43:21 +0200 (CEST)
Received: from localhost ([::1]:44112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbqK-0002UK-GL
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhbfn-0004BQ-Cl
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhbfl-00084z-FV
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621013544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQ+9WB+23Pi+PcVZq/NIGeETo9Pj2w6oa79+h+7X6Co=;
 b=OfhW182Xn7iamZkqyCqU6wKrQ8v/Qdyzttwiz7YWipDSmD0QHA6BGOEfcXhx1X3kKPBHWl
 ICnpCn2omZecPjNoFAW0wfAcdUCZTZrOQovVZAV1Sgs/EAMNGox59qLQpWSFWi2jgp8Av7
 l19NWEEpB2s/hiRsIbSEr7jkNb+88hs=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-JBwxddKEN9Kl8m9iSNbIFw-1; Fri, 14 May 2021 13:32:17 -0400
X-MC-Unique: JBwxddKEN9Kl8m9iSNbIFw-1
Received: by mail-vk1-f199.google.com with SMTP id
 j199-20020a1fa0d00000b02901fb4c9e1345so105005vke.0
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 10:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YQ+9WB+23Pi+PcVZq/NIGeETo9Pj2w6oa79+h+7X6Co=;
 b=jT7BSFpLs/uW/O0jMpbYFDX1tQe01F2FF4OHRXG0jmd/4Nqaq6mizsZSa5cjGbebxt
 XhtYA9IRYZ42tyXyFXjrVhDOvjzPnnvVRhN2kB2fZ1hiyXTrPvxmsac2jeLoMRf/fgWb
 SkQfyNE/V+BvIa6ns7P9PKJt/ITXXs0EphlZ4QeUAzzLD8ixwVXF5Dyo8o00JPO+tOaY
 XJ6oK+Oihj/X6kyLrgXiwFV+ode7UphyYMN3/7XLQaIi4C2yWJVK89wIG0FvuT87gDwC
 9NEMcx8fIATryObjA3al+RpCOIhbzCEjYS7eRaQSkmsckzxLAPslMVKBhyyXpurAwgMH
 cUyg==
X-Gm-Message-State: AOAM530pO/78C9UoWXO6COn4xJauQFyyprf/scjAwy/US7/gAibhUAoj
 rOxluf9wdhbmeeW7fUSH4vhYfz1Ny/u8+e6U8Id5iXObR5g63SV0hNAO4TWjCw7ZZBuRqQHKBKZ
 Yw7PpV+nne2Bdi1WUrEgoy+xctmkvA6Q=
X-Received: by 2002:a67:6f86:: with SMTP id k128mr39761419vsc.50.1621013536943; 
 Fri, 14 May 2021 10:32:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuM0QXdxJsx1j2gGMnvvYZPCrcA6PzBbJJebSFsnm3wS3qMSBBgKDPQfqBzAWHoQ4Mb0IpYLIE8PFLdZpuBoM=
X-Received: by 2002:a67:6f86:: with SMTP id k128mr39761328vsc.50.1621013536672; 
 Fri, 14 May 2021 10:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-9-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-9-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 14 May 2021 14:31:50 -0300
Message-ID: <CAKJDGDagY-w0o++QV5qYccEmNaH8W=rOyzLNircYKT4116HQgw@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] tests/vm: convert centos VM recipe to CentOS 8
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 9:05 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  tests/vm/centos | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/tests/vm/centos b/tests/vm/centos
> index efe3dbbb36..5c7bc1c1a9 100755
> --- a/tests/vm/centos
> +++ b/tests/vm/centos
> @@ -26,24 +26,23 @@ class CentosVM(basevm.BaseVM):
>          export SRC_ARCHIVE=3D/dev/vdb;
>          sudo chmod a+r $SRC_ARCHIVE;
>          tar -xf $SRC_ARCHIVE;
> -        make docker-test-block@centos7 {verbose} J=3D{jobs} NETWORK=3D1;
> -        make docker-test-quick@centos7 {verbose} J=3D{jobs} NETWORK=3D1;
> +        make docker-test-block@centos8 {verbose} J=3D{jobs} NETWORK=3D1;
> +        make docker-test-quick@centos8 {verbose} J=3D{jobs} NETWORK=3D1;
>          make docker-test-mingw@fedora  {verbose} J=3D{jobs} NETWORK=3D1;
>      """
>
>      def build_image(self, img):
> -        cimg =3D self._download_with_cache("https://cloud.centos.org/cen=
tos/7/images/CentOS-7-x86_64-GenericCloud-1802.qcow2.xz")
> +        cimg =3D self._download_with_cache("https://cloud.centos.org/cen=
tos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2"=
)

I wonder why they didn't keep the compressed option for download.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


