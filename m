Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CAA18D44B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 17:23:43 +0100 (CET)
Received: from localhost ([::1]:55722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFKQw-0000e3-Nz
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 12:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wrampazz@redhat.com>) id 1jFKPu-0008JB-SU
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 12:22:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wrampazz@redhat.com>) id 1jFKPt-0008AS-Lp
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 12:22:38 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:36334)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wrampazz@redhat.com>) id 1jFKPt-00089t-IE
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 12:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584721355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UFoHXv5Hrawp7KNGe7SXvxXXUtqQfDQ4y+S/TuMSsa8=;
 b=Pgrargdabp93yIARO/iqtwKN/bn/H2jfJGz4h79B7EAUDmCjMKV/mzOkdCojZ5gVum2YVd
 RPJGf8/eGnRytJCTTwRJyOcCgXRiIYrsoFHNwkhKYj8HaaFwbc6wC+0cAljrgssVYIDE0O
 EtWZwn853aMyREX8nOs5VR2kD8m1Pjw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-Om-SkECJMhGvC9qRG3IeUg-1; Fri, 20 Mar 2020 12:22:33 -0400
X-MC-Unique: Om-SkECJMhGvC9qRG3IeUg-1
Received: by mail-wr1-f70.google.com with SMTP id r9so723475wrs.13
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 09:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I4Ig+iwdrKenFKcZjeRtz+NCY5BBh0HcpWa+Y4zpiLg=;
 b=LuqucEF8ZbjzUir/n5u9YKBCoE1c/O5xlegkZrKUZprcZgpAAuDeeBlzJIjVVFX9Mg
 HnTIPaKhOmGzJMhfd14qMEa1pVMLtHMezhmMjhQdyqInoIltv6+mP05nUWv07apv2DbP
 3oOXiJy+j3ETDhQUXZaz5fuHFPtSTj/3Ypqvtq2qJvNI6RHTi1TOMR7IlPWilLIx4B7u
 GOOi1fj8R+kAVCuIaJuNoomd1ISYAc9Tk768NT2CHwXJ9blcOow2kW4DFD95hd3vt0E0
 DLQhNcK0uzlDMozm7Zb9ewagv+izKmqFP1w2VCO9ruOMhd1Rsv42m0W5uDR02mgpdKqP
 e4ag==
X-Gm-Message-State: ANhLgQ1qEs5f79QhTIxyXc7OI2oxkowGBKekA6LkRhPRPFq1JjFMlmM2
 V+8DHSK/MUK69dykg2bc/FtVcYf+kaEPMU/utfNH9wuYa8ATm7kiOujFLMUsA+LiNqslrKBOm6w
 gTiHiRGE78sPw/u+YGLLxDgAZNcIwYy8=
X-Received: by 2002:a05:600c:2c51:: with SMTP id
 r17mr3239521wmg.64.1584721352577; 
 Fri, 20 Mar 2020 09:22:32 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsOVuzHf9IWiUfIsblddp4EQBEceJ2WhM2g1GKnN9zFi4/ZAayJF2UHkFtmQ8fEHVAmQMIa9kFhO5gbHfd7qGQ=
X-Received: by 2002:a05:600c:2c51:: with SMTP id
 r17mr3239496wmg.64.1584721352278; 
 Fri, 20 Mar 2020 09:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200320151254.16766-1-ovoshcha@redhat.com>
 <20200320151254.16766-3-ovoshcha@redhat.com>
In-Reply-To: <20200320151254.16766-3-ovoshcha@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 20 Mar 2020 13:22:21 -0300
Message-ID: <CAKJDGDYf=_OUojiiB0MxS-j03kmpLzoCq8U8arSbBGTN0sS+4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] Acceptance test: provides new functions
To: Oksana Vohchana <ovoshcha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Oksana,

On Fri, Mar 20, 2020 at 12:15 PM Oksana Vohchana <ovoshcha@redhat.com> wrot=
e:
>
> Provides new functions related to the rdma migration test
> Adds functions to check if service RDMA is enabled and gets
> the ip address on the interface where it was configured
>
> Signed-off-by: Oksana Vohchana <ovoshcha@redhat.com>
> ---
>  tests/acceptance/migration.py | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.p=
y
> index e4c39b85a1..a783f3915b 100644
> --- a/tests/acceptance/migration.py
> +++ b/tests/acceptance/migration.py
> @@ -11,12 +11,17 @@
>
>
>  import tempfile
> +import json
>  from avocado_qemu import Test
>  from avocado import skipUnless
>
>  from avocado.utils import network
>  from avocado.utils import wait
>  from avocado.utils.path import find_command
> +from avocado.utils.network.interfaces import NetworkInterface
> +from avocado.utils.network.hosts import LocalHost
> +from avocado.utils import service
> +from avocado.utils import process
>
>
>  class Migration(Test):
> @@ -58,6 +63,31 @@ class Migration(Test):
>              self.cancel('Failed to find a free port')
>          return port
>
> +    def _if_rdma_enable(self):
> +        rdma_stat =3D service.ServiceManager()
> +        rdma =3D rdma_stat.status('rdma')
> +        return rdma

You can just `return rdma_stat.status('rdma')` here! Also, as you are
not using any of the class attributes or methods, if you make this
method static, you don't need to call it with `None` as you did on
patch 3 of this series.

> +
> +    def _get_interface_rdma(self):
> +        cmd =3D 'rdma link show -j'
> +        out =3D json.loads(process.getoutput(cmd))
> +        try:
> +            for i in out:
> +                if i['state'] =3D=3D 'ACTIVE':
> +                    return i['netdev']
> +        except KeyError:
> +            return None

Same comment about making this method static.

Actually, if you are not using any of the attributes or methods from
the Migration class on these two methods, I think you can define them
as functions, outside of the Class. Does it make sense?

> +
> +    def _get_ip_rdma(self, interface):
> +        local =3D LocalHost()
> +        network_in =3D NetworkInterface(interface, local)
> +        try:
> +            ip =3D network_in._get_interface_details()
> +            if ip:
> +                return ip[0]['addr_info'][0]['local']
> +        except:
> +            self.cancel("Incorrect interface configuration or device nam=
e")
> +

If you change the logic a bit and raise an exception here, instead of
doing a `self.cancel`, you can also make this method static, or move
it outside of the class. The cancel can be handled in the test, with
the exception raised here.

>
>      def test_migration_with_tcp_localhost(self):
>          dest_uri =3D 'tcp:localhost:%u' % self._get_free_port()
> --
> 2.21.1
>
>

Let me know if the comments do not make sense.

Willian


