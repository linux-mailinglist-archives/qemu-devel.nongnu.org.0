Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A025133CC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:34:40 +0200 (CEST)
Received: from localhost ([::1]:42838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk3Lz-00032O-7j
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nk3Ke-00013l-Dm
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:33:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nk3Kb-0006J1-0Y
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651149191;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RhB/tRqJKoOZAuv6kO6wVb9MpnTmvSqPMCzOQqfwMn8=;
 b=bxf8DEteaCrBVMkML2xfQvnli+WD2zocGjbQqyjY4y8W4PsIs0eZ+lIz3EtCCs7/eY3ggQ
 xqv7Kf//N4YPPfw5aPDfKN8+HPla0EIOYhaaNNQhZ30f+Rz17JtSe9NfA5/bYJGObTSpOC
 wFyBeQF38Dwo6mhJysUpfvIiJcfcZ08=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-gVnH2nEhO72HkeS7WNTNIw-1; Thu, 28 Apr 2022 08:33:05 -0400
X-MC-Unique: gVnH2nEhO72HkeS7WNTNIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BC7086B8A3;
 Thu, 28 Apr 2022 12:33:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31A1240869CB;
 Thu, 28 Apr 2022 12:33:04 +0000 (UTC)
Date: Thu, 28 Apr 2022 13:33:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jinpu Wang <jinpu.wang@ionos.com>
Subject: Re: RFC: sgx-epc is not listed in machine type help
Message-ID: <YmqJfa9510SO1yuS@redhat.com>
References: <CAMGffEmEmWK99xDu=i2iq9WeTxdPwnG9-94UEqFnBSzmvv=TWQ@mail.gmail.com>
 <20220428114850.GA20626@yangzhon-Virtual>
 <CAMGffEmGjwAViuRa+ORMyO3+P7KhoOeuvNF3a3tju-WEMLdSrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMGffEmGjwAViuRa+ORMyO3+P7KhoOeuvNF3a3tju-WEMLdSrw@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Yu Zhang <yu.zhang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 02:18:54PM +0200, Jinpu Wang wrote:
> On Thu, Apr 28, 2022 at 2:05 PM Yang Zhong <yang.zhong@intel.com> wrote:
> >
> > On Thu, Apr 28, 2022 at 01:59:33PM +0200, Jinpu Wang wrote:
> > > Hi Yang, hi Paolo,
> > >
> > > We noticed sgx-epc machine type is not listed in the output of
> > > "qemu-system-x86_64 -M ?",
> snip
> > >
> > >
> > > I think this would cause confusion to users, is there a reason behind this?
> > >
> >
> >   No specific machine type for SGX, and SGX is only supported in Qemu PC and Q35 platform.
> Hi Yang,
> 
> Thanks for your quick reply. Sorry for the stupid question.
> The information I've got from intel or the help sample from
> https://www.qemu.org/docs/master/system/i386/sgx.html, We need to
> specify commands something like this to run SGX-EPC guest:
> qemu-system-x86-64 -m 2G -nographic -enable-kvm -cpu
> host,+sgx-provisionkey  -object
> memory-backend-epc,id=mem1,size=512M,prealloc=on -M
> sgx-epc.0.memdev=mem1,sgx-epc.0.node=0 /tmp/volume-name.img

That isn't an sgx-epc machine type.

That is an (implicit) i440fx  machine type, with an sgx-epc.0.memdev
property being set.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


