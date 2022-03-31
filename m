Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EEE4EDD8A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:41:12 +0200 (CEST)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwv9-0006KS-E3
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:41:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZwtF-0004K4-Ub
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:39:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZwtB-0008Uy-BF
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648741147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ec+x5EbqnV4WfK/hOHjWrbaP87rnluF0EELyp7M7Ebk=;
 b=d5/i1/bMxanRLJpaXBg3RrWC8nQBYw00H+vMFHPpFtJHLZ6StfRH4gqn76jg6uhfh9Dblm
 vAz9lrKtbFctQTA5eSc+jKdn5hFEiIpvj0cvR8qMZUSe0LZhSX/xOwlCn+TDfVbhrREkMb
 i6lB4QxrrQ/SKTzPUftHO8yXrdwKyfw=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-NhdjTl8KO5aqnRt9ZSjbEg-1; Thu, 31 Mar 2022 11:39:06 -0400
X-MC-Unique: NhdjTl8KO5aqnRt9ZSjbEg-1
Received: by mail-ua1-f69.google.com with SMTP id
 l29-20020ab03d9d000000b0035c7d1541a5so13248uac.10
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ec+x5EbqnV4WfK/hOHjWrbaP87rnluF0EELyp7M7Ebk=;
 b=pObwRwCmH7McB1gqr33wxEFQWbcF6QrLf4B+0Y/yOHG79u0eAwRMq6L/C6qG4r0OIk
 sn3I0K3n1OMAFS7Sw+X2FS2++WRmtd3y/5eTNyIQ1m2JNr2cW+a5vTqEH7+kGY3os76q
 x1+CGgSFwJbiG8JC1vEVvxHAJSSApE0GhZtL1OhE07wvQQNFOMCwD7TKB55iv/qIB6Fj
 vt4aHBwY78uwDfFbMFsDPh82TSnp0UsT+aXTKAakvWNV/ztjXseWmYJZYQp4qPMevi6A
 v9bE/ovy9tO6ZBGkrJUDCEs81TlkOq4W7C12U7KLW/4o22C38ILnjmDMy5kmB13I+c8O
 DQJw==
X-Gm-Message-State: AOAM530Pr/OqEc6PdESwTwVhDRT3lW4GOM8UY0U0hdKVNJU7KThRMCez
 ryXXwMH1R4BrZOnfRtstfQ5JGEvE0wZz4G7/fCPy3qaQAD5U/k4ZzF3qO++ZKGNp5aBEk4GpaME
 6JwodDyUZGk6tR/fZ+WAYSSZpMgtGXYY=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr1906332vsx.61.1648741145870; 
 Thu, 31 Mar 2022 08:39:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTvOrwuHdehIj4SuSNytTOowMpdCH8aXlOVB1e8qftLqZsMkGbR1f1+qSjbh0WwwRHkk+8/lRwUwDGi20ziVs=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr1906312vsx.61.1648741145559; Thu, 31
 Mar 2022 08:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-10-maxim.davydov@openvz.org>
 <00246e6f-85a4-487f-7025-fe616a65ebe6@mail.ru>
In-Reply-To: <00246e6f-85a4-487f-7025-fe616a65ebe6@mail.ru>
From: John Snow <jsnow@redhat.com>
Date: Thu, 31 Mar 2022 11:38:54 -0400
Message-ID: <CAFn=p-Y8t0qLK8thL04roD2qXRcfL+gVDTimR4Gy2hwfsf3YAA@mail.gmail.com>
Subject: Re: [PATCH v1 9/9] scripts: printing machine type compat properties
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel Berrange <berrange@redhat.com>, xiaoguangrong.eric@gmail.com,
 Michael Tsirkin <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 chen.zhang@intel.com, qemu-devel <qemu-devel@nongnu.org>,
 wangyanan55@huawei.com,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 imammedo@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 lizhijian@fujitsu.com, den@openvz.org, ani@anisinha.ca,
 Maxim Davydov <maxim.davydov@openvz.org>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 11:55 AM Vladimir Sementsov-Ogievskiy
<v.sementsov-og@mail.ru> wrote:
>
> 29.03.2022 00:15, Maxim Davydov wrote:
> > This script makes the information that can be obtained from
> > query-init-properties and query-machines easy to read.
> >
> > Note: some init values from the devices can't be available like propert=
ies
> > from virtio-9p when configure has --disable-virtfs. Such values are
> > replaced by "DEFAULT". Another exception is properties of abstract
> > classes. The default value of the abstract class property is common
> > value of all child classes. But if the values of the child classes are
> > different the default value will be "BASED_ON_CHILD" (for example, old
> > x86_64-cpu can have unsupported feature).
> >
> > Example:
> >
> >      1) virsh qemu-monitor-command VM --pretty \
> >         '{"execute" : "query-init-properties"}' > init_props.json
> >
> >      2) virsh qemu-monitor-command VM --pretty \
> >         '{"execute" : "query-machines", "arguments" : {"is-full" : true=
}}' \
> >         > compat_props.json
> >
> >      3) scripts/print_MT.py --MT_compat_props compat_props.json\
> >          --init_props init_props.json --mt pc-q35-7.0 pc-q35-6.1
> >

Being able to parse existing JSON files is nice, but have you also
considered baking the QMP querying directly into this script?

> > Output:
> > =E2=95=92=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=A4=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=A4=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=95
> > =E2=94=82           property_name           =E2=94=82  pc-q35-7.0  =E2=
=94=82  pc-q35-6.1  =E2=94=82
> > =E2=95=9E=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=AA=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=AA=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=A1
> > =E2=94=82   ICH9-LPC-x-keep-pci-slot-hpc    =E2=94=82     True     =E2=
=94=82    False     =E2=94=82
> > =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=A4
> > =E2=94=82          nvme-ns-shared           =E2=94=82     True     =E2=
=94=82     off      =E2=94=82
> > =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=A4
> > =E2=94=82 vhost-user-vsock-device-seqpacket =E2=94=82     auto     =E2=
=94=82     off      =E2=94=82
> > =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=A4
> > =E2=94=82 virtio-mem-unplugged-inaccessible =E2=94=82     auto     =E2=
=94=82     off      =E2=94=82
> > =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=A4
> > =E2=94=82  x86_64-cpu-hv-version-id-build   =E2=94=82    14393     =E2=
=94=82    0x1bbc    =E2=94=82
> > =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=A4
> > =E2=94=82  x86_64-cpu-hv-version-id-major   =E2=94=82      10      =E2=
=94=82    0x0006    =E2=94=82
> > =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=A4
> > =E2=94=82  x86_64-cpu-hv-version-id-minor   =E2=94=82      0       =E2=
=94=82    0x0001    =E2=94=82
> > =E2=95=98=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=A7=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=A7=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=9B
> >
> > Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
> > ---
> >   scripts/print_MT.py | 274 +++++++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 274 insertions(+)
> >   create mode 100755 scripts/print_MT.py
> >
> > diff --git a/scripts/print_MT.py b/scripts/print_MT.py
> > new file mode 100755
> > index 0000000000..8be13be8d7
> > --- /dev/null
> > +++ b/scripts/print_MT.py
> > @@ -0,0 +1,274 @@
> > +#! /usr/bin/python3
>
> Standard shebang line for python3 is:
>
> #!/usr/bin/env python3
>
>
> > +#
> > +# Script for printing machine type compatible features. It uses two JS=
ON files
> > +# that should be generated by qmp-init-properties and query-machines.
> > +#
> > +# Copyright (c) 2022 Maxim Davydov <maxim.davydov@openvz.org>
> > +#
> > +# This program is free software; you can redistribute it and/or modify
> > +# it under the terms of the GNU General Public License as published by
> > +# the Free Software Foundation; either version 2 of the License, or
> > +# (at your option) any later version.
> > +#
> > +# This program is distributed in the hope that it will be useful,
> > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +# GNU General Public License for more details.
> > +#
> > +# You should have received a copy of the GNU General Public License
> > +# along with this program. If not, see <http://www.gnu.org/licenses/>.
> > +#
> > +
> > +import pandas as pd
> > +import json
> > +from tabulate import tabulate
> > +from argparse import ArgumentParser
> > +
> > +
> > +# used for aliases and other names that can be changed
> > +aliases =3D { "e1000-82540em": "e1000" }
> > +
> > +
> > +def get_major(mt):
> > +    splited =3D mt.split('.')
> > +    if (len(splited) >=3D 2):
> > +        return int(mt.split('.')[1])
>
> why to call split() again? You may use splited[1]
>
> > +    else:
> > +        return 0
> > +
> > +
> > +def get_prefix(mt):
> > +    splited =3D mt.split('.')
> > +    if (len(splited) >=3D 1):
>
> In python you don't need braces around if condition:
>
>     if len(splited) >=3D 1:
>
> is the same thing.
>
> > +        return mt.split('.')[0]
> > +    else:
> > +        return mt
>
> seems, split() never return empty list, so len is always >=3D1.
>
> You can do simply
>
> return mt.split(',', 1)[0]
>
> > +
> > +
> > +def get_mt_sequence(mt_data):
> > +    mt_list =3D [mt['name'] for mt in mt_data['return']]
> > +    mt_list.remove('none')
> > +
> > +    mt_list.sort(key=3Dget_major, reverse=3DTrue)
> > +    mt_list.sort(key=3Dget_prefix, reverse=3DTrue)
>
> Aha. You may use one sort() call, if use tuple as key. Something like thi=
s should work:
>
> def parse_mt(mt):
>    spl =3D mt.split('.')
>    if len(spl) >=3D 2:
>      return spl[0], spl[1]
>    else:
>      return mt, 0
>
> ...
>
> mt_list.sort(key=3Dparse_mt, ...)
>
> > +
> > +    return mt_list
> > +
> > +
> > +def get_req_props(defval_data, prop_set, abstr_class_to_features):
> > +    req_prop_values =3D dict()
> > +    req_abstr_prop_values =3D dict()
>
> {} construction is native way to create empty dict:
>
>    req_prop_values =3D {}
>
> > +
> > +    for device in defval_data['return']:
> > +        # Skip cpu devices that will break all default values for cpus
> > +        if device['name'] =3D=3D 'base-x86_64-cpu':
> > +            continue
> > +        if device['name'] =3D=3D 'max-x86_64-cpu':
> > +            continue
> > +
> > +        # some features in mt set as one absract class
> > +        # but this features are owned by another class
>
> Hmm. That all hard for me to review, because I don't know the whole model=
 of machine types.. Don't we have a documentation somewhere? Which objects,=
 classes, abstart classes and properties we have and what that all mean.
>
> > +        device_props_owners =3D dict()
> > +        for props_class in device['props']:
> > +            if not 'classprops' in props_class: # for example, Object =
class
>
> More pythonic is:
>
>    if 'classprops' not in props_class:
>
> > +                continue
> > +
> > +            for prop in props_class['classprops']:
> > +                if not 'value' in prop:
> > +                    continue
> > +
> > +                prop_name =3D device['name'] + '-' + prop['name']
> > +                device_props_owners[prop['name']] =3D prop['value']
> > +                if prop_name in prop_set:
> > +                    req_prop_values[prop_name] =3D prop['value']
> > +
> > +        for props_class in device['props']:
> > +            if not props_class['classname'] in abstr_class_to_features=
:
> > +                continue
> > +
> > +            for req_prop in abstr_class_to_features[props_class['class=
name']]:
> > +                if not req_prop in device_props_owners:
> > +                    continue
> > +
> > +                prop_value =3D device_props_owners[req_prop]
> > +                prop_name =3D props_class['classname'] + '-' + req_pro=
p
> > +                if req_abstr_prop_values.setdefault(prop_name, prop_va=
lue) \
> > +                    !=3D prop_value:
> > +                    req_abstr_prop_values[prop_name] =3D 'BASED_ON_CHI=
LD'
> > +
> > +    return req_prop_values, req_abstr_prop_values
> > +
> > +
> > +def make_definition_table(mt_to_compat_props, prop_set,
> > +                          req_props, req_abstr_props, is_full):
> > +    mt_table =3D dict()
> > +    for prop in sorted(prop_set):
> > +        if not is_full:
> > +            values =3D set()
> > +            for mt in mt_to_compat_props:
> > +                if prop in mt_to_compat_props[mt]:
> > +                    values.add(mt_to_compat_props[mt][prop])
> > +                else:
> > +                    if prop in req_props:
> > +                        values.add(req_props[prop])
> > +                    else:
> > +                        values.add('DEFAULT')
> > +            # Skip the property if its value is the same for
> > +            # all required machines
> > +            if len(values) =3D=3D 1:
> > +                continue
> > +
> > +        mt_table.setdefault('property_name', []).append(prop)
> > +        for mt in mt_to_compat_props:
> > +            if prop in mt_to_compat_props[mt]:
> > +                value =3D mt_to_compat_props[mt][prop]
> > +                mt_table.setdefault(mt, []).append(value)
> > +            else:
> > +                if prop in req_props:
> > +                    mt_table.setdefault(mt, []).append(req_props[prop]=
)
> > +                else:
> > +                    value =3D req_abstr_props.get(prop, 'DEFAULT')
> > +                    mt_table.setdefault(mt, []).append(value)
> > +
> > +    return mt_table
> > +
> > +
> > +def get_standard_form(value):
> > +    if type(value) is str:
> > +        out =3D value.upper()
> > +        if out.isnumeric():
> > +            return int(out)
> > +        if out =3D=3D 'TRUE':
> > +            return True
> > +        if out =3D=3D 'FALSE':
> > +            return False
> > +
> > +    return value
> > +
> > +
> > +def get_features(mt_data, defval_data, mts, is_full):
> > +    prop_set =3D set()
> > +    abstr_prop_set =3D set()
> > +    mt_to_compat_props =3D dict()
> > +    # It will be used for searching appropriate feature (sometimes cla=
ss name
> > +    # in machine type definition and real class name are different)
> > +    abstr_class_to_features =3D dict()
> > +
> > +    for mt in mt_data['return']:
> > +        if mt['name'] =3D=3D 'none':
> > +            continue
> > +
> > +        if not mt['name'] in mts:
> > +            continue
> > +
> > +        mt_to_compat_props[mt['name']] =3D dict()
> > +        for prop in mt['compat-props']:
> > +            driver_name =3D aliases.get(prop['driver'], prop['driver']=
)
> > +            prop_name =3D prop['driver'] + '-' + prop['property']
> > +            real_name =3D driver_name + '-' + prop['property']
> > +            # value is always string
> > +            prop_val  =3D get_standard_form(prop['value'])
> > +            if prop['abstract']:
> > +                mt_to_compat_props[mt['name']][real_name] =3D prop_val
> > +                abstr_prop_set.add(real_name)
> > +                abstr_class_to_features.setdefault(driver_name,
> > +                                                   set()).add(prop['pr=
operty'])
> > +            else:
> > +                mt_to_compat_props[mt['name']][real_name] =3D prop_val
> > +                prop_set.add(real_name)
> > +
> > +    req_props, req_abstr_props =3D get_req_props(defval_data, prop_set=
,
> > +                                               abstr_class_to_features=
)
> > +
> > +    # join sets for global sorting by name
> > +    prop_set.update(abstr_prop_set)
> > +    mt_table =3D make_definition_table(mt_to_compat_props, prop_set, r=
eq_props,
> > +                                     req_abstr_props, is_full)
> > +    # to save mt sequence
> > +    df =3D pd.DataFrame({'property_name': mt_table['property_name']})
> > +    for mt in mts:
> > +        if not mt in mt_table:
> > +            print('Error: {0} no found'.format(mt))
> > +            continue
> > +        df[mt] =3D mt_table[mt]
> > +
> > +    return df
> > +
> > +
> > +def main():
> > +    parser =3D ArgumentParser(description=3D'''Print definition of mac=
hine
> > +                                           type (compatible features)'=
'')
> > +    parser.add_argument('--MT_compat_props', type=3Dstr, required=3DTr=
ue,
> > +                        help=3D'''Path to JSON file with current machi=
ne type
> > +                                definition. It must be generated via
> > +                                query-machines with is-full option.'''=
)
> > +    parser.add_argument('--init_props', type=3Dstr, required=3DTrue,
> > +                        help=3D'''Path to JSON file with initial featu=
res. It
> > +                                must be generated via
> > +                                query-init-properties.''')
> > +    parser.add_argument('--format', type=3Dstr,
> > +                        choices=3D['table', 'csv', 'html', 'json'],
> > +                        default=3D'table', help=3D'Format of the outpu=
t file')
> > +    parser.add_argument('--file', type=3Dstr,
> > +                        help=3D'''Path to output file. It must be set =
with csv
> > +                                and html formats.''')
> > +    parser.add_argument('--all', action=3D'store_true',
> > +                        help=3D'''Print all available machine types (l=
ist of
> > +                                machine types will be ignored''')
> > +    parser.add_argument('--mt', nargs=3D"*", type=3Dstr,
> > +                        help=3D'List of machine types that will be com=
pared')
> > +    parser.add_argument('--full', action=3D'store_true',
> > +                        help=3D'''Print all defined properties (by def=
ault,
> > +                                only properties with different values =
are
> > +                                printed)''')
> > +
> > +    args =3D parser.parse_args()
> > +
> > +    if args.all =3D=3D 0 and args.mt =3D=3D None:
>
> Don't compare boolean value with zero, use it as is (I'm about args.all, =
but comparing mt with None doesn't make real sense here too):
>
>    if not(args.all or args.mt):
>
> > +        print('Enter the list of required machine types (list of all '=
\
> > +              'machine types : qemu-system-x86_64 --machine help)')
> > +        return
> > +
> > +    with open(args.MT_compat_props) as mt_json_file:
> > +        mt_data =3D json.load(mt_json_file)
> > +
> > +    with open(args.init_props) as defval_json_file:
> > +        defval_data =3D json.load(defval_json_file)
> > +
> > +    if args.all:
> > +        df =3D get_features(mt_data, defval_data, get_mt_sequence(mt_d=
ata),
> > +                          args.full)
> > +    else:
> > +        df =3D get_features(mt_data, defval_data, args.mt, args.full)
>
> I'd write it like this:
>
> mt =3D args.mt or get_mt_sequence(mt_data)
> df =3D get_feature(..., mt, args.full)
>
> > +
> > +    if args.format =3D=3D 'csv':
> > +        if args.file =3D=3D None:
> > +            print('Error: csv format requires path to output file')
> > +            return
> > +        df.to_csv(args.file)
> > +    elif args.format =3D=3D 'html':
> > +        if args.file =3D=3D None:
> > +            print('Error: html format requires path to output file')
> > +            return
> > +        with open(args.file, 'w') as output_html:
> > +            output_html.write(df.to_html(justify=3D'center', col_space=
=3D'400px',
> > +                                         index=3DFalse))
> > +    elif args.format =3D=3D 'json':
> > +        json_table =3D df.to_json()
> > +        if args.file =3D=3D None:
> > +            print(json_table)
> > +        else:
> > +            with open(args.file, 'w') as output_json:
> > +                output_json.write(json_table)
> > +    elif args.format =3D=3D 'table':
> > +        table =3D tabulate(df, showindex=3DFalse, stralign=3D'center',
> > +                         tablefmt=3D'fancy_grid', headers=3D'keys')
> > +        if args.file =3D=3D None:
> > +            print(table)
> > +        else:
> > +            with open(args.file, 'w') as output_table:
> > +                output_table.write(table)
>
> For me this looks like extra logic.
>
> Why to restrict printing csv/html directly to stdout? It's native to use =
output redirection to save output to some file. I think you can simply drop=
 --file argument always print to stdout.
>
> Or, if you still want this option, it's better to prepare the whole outpu=
t in string variable, and then handle it once:
>
> if ...
> elif ...
> elif ...
>
> ...
>
> if args.file:
>    with open(...) as f:
>      f.write(output)
> else:
>    print(output)
>
> > +
> > +
> > +if __name__ =3D=3D '__main__':
> > +    main()
>
>
> --
> Best regards,
> Vladimir
>

I trust Vladimir's review on python scripting otherwise.

--js


