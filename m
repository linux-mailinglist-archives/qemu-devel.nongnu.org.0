Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BDE4929DF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:50:08 +0100 (CET)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qkI-000375-QH
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:50:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n9plt-0004q6-E8
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 09:47:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n9plq-0002t4-IP
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 09:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642517256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ar7zPMcDxUJJoYX6KSVwpNqXtONL6Da7Fy0hRLkNFMw=;
 b=SmMSAIz+3uuoX5vUVYndJ60LUfXwpzfxJ0H9vzlGSj4INairan7WkX9rMWyYOaJeqwLyop
 PWq+Zu2HS/6WAemZr1shcvJfhYYJxO7vGLdn2FRO2FtvtFc9H1lSuIgeZZWy9GhB0G7gqT
 dev9G7EfOd1d4lJaqHMXkDZ2DH7e5MA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-ZA-_P5JXO8Wk9sf6ZYR5Xw-1; Tue, 18 Jan 2022 09:47:34 -0500
X-MC-Unique: ZA-_P5JXO8Wk9sf6ZYR5Xw-1
Received: by mail-ed1-f71.google.com with SMTP id
 i9-20020a05640242c900b003fe97faab62so17109611edc.9
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 06:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9uFIl/2pcUvx1tHbqt7nc+ku59bSc0iy3DSVOFGdGEQ=;
 b=q42iki+DOTmuCEyCKjGHcQq09XbTr7U2YuY9yuV8GZy6KNM1kz7DefPe1m6Ls/j9Ol
 KekdOiQ5d/K3xLZq6zee/7L9SJr/6vXEcbDdCwyNBkS7FAsLo5IBeM5i4r8BxfWpfEjE
 kJNXaNO78aEE17n/jFSXWXTFMdVoNIPdfiT6H+8izbBchzCK+eSNqs8r8QWhpEfiQjcW
 hqW0awC9sXqpORAx6nGzHeW0pMMN+4FAlMBu07Vuv7ULZYwyZJiVXtvVnja4yoxlp/kr
 CrGsWFiewMInBGoTwKfdvXIbJOjVhIeMVhw7Ovb3bzh8d/tPCKyfcRs7J2WcGy/1bXg0
 jXIQ==
X-Gm-Message-State: AOAM531bu+sCpLgyz17LRhg87REdi1lWrsBVUvRc7I1Pxx8fJU6qzGaF
 3zv+rv8ReM8EMoBtn9NwdN7nmEMVz0LD8QnYAYcuJNYslMs5SrWpP53U+dotlFIYOOanSPkcI4w
 gT3Tf42ekg0wWMSs=
X-Received: by 2002:a17:906:6a20:: with SMTP id
 qw32mr20629205ejc.724.1642517253749; 
 Tue, 18 Jan 2022 06:47:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylAulDqLn6QUY5+HXcOubg+t+pd/r3xfa9ow2jH2lk4jwr/pCLWmleQ+VwTYKLIHrAJXn9jQ==
X-Received: by 2002:a17:906:6a20:: with SMTP id
 qw32mr20629190ejc.724.1642517253529; 
 Tue, 18 Jan 2022 06:47:33 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id r17sm7153029edw.70.2022.01.18.06.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 06:47:33 -0800 (PST)
Date: Tue, 18 Jan 2022 15:47:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH v2 1/3] qmp: Support for querying stats
Message-ID: <20220118154731.159e4b23@redhat.com>
In-Reply-To: <Yea3+t4qtk4iB9jr@redhat.com>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
 <20211119195153.11815-2-mark.kanda@oracle.com>
 <Ya+rLex1djU/1Wc1@redhat.com>
 <ee0d6990-06f3-9a1b-f7d5-7c379f0e9773@redhat.com>
 <5b2f4acf-29fb-34fd-eee0-341eec163da7@oracle.com>
 <a39efdf3-82f3-9042-8b53-86394d7aa90d@redhat.com>
 <Yea3+t4qtk4iB9jr@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jan 2022 12:52:10 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, Jan 18, 2022 at 01:26:32PM +0100, Paolo Bonzini wrote:
> > On 1/17/22 16:17, Mark Kanda wrote: =20
> > > >=20
> > > > I agree except that I think this and StatsResults should be unions,
> > > > even if it means running multiple query-stats commands. =20
> > >=20
> > > IIUC, making StatsResults a union implies the filter is a required
> > > argument (currently it is optional - omitting it dumps all VM and VCP=
U
> > > stats). Just to confirm - we want the filter to be required? =20
> >=20
> > Yeah, I think at least the "kind" (vcpu, vm, perhaps in the future bloc=
k or
> > net) should be mandatory.  If the caller doesn't know of a "kind", chan=
ces
> > are it won't be able to understand what object the stats refer to, for
> > example the vcpu "id" here:
> >=20
> > { 'union': 'StatsResults',
> >    'base': { 'target': 'StatsTarget', stats: ['StatsResultsEntry'] },
> >    'discriminator': 'target',
> >    'data': { 'vcpu': ['id': 'int'] }
> > }
> >=20
> > (which is another different between Daniel's proposal and mine; his jus=
t
> > placed all vcpus into an array with no explicit id, if I understand
> > correctly). =20
>=20
> An explicit ID isn't strictly required, since the caller can assume
> the results are ordered on CPU ID, so even if they gave a request
> for a sparse subset of CPUs, the results can be interpreted.  None
> the less having a vCPU id included is more friendly, so worth
> having.

and what exactly this CPU ID is,
may QOM path pointing to VCPU instance would be better?

>=20
> Regards,
> Daniel


