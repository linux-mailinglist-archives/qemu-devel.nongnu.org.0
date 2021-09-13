Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC32409226
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:08:56 +0200 (CEST)
Received: from localhost ([::1]:53290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmdj-0004W7-IK
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mPlxR-00088H-Vc
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:25:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mPlxO-0008TH-Oo
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631539510;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BchXbJsyhbR/xbAoBASclGup65MqpxAxNjiwRBKW93w=;
 b=GfEwbiL3gRsQm+qH0bqcsirnkJIdc+R5WEJORZdrpFG9Bh6E1vQ3KGxxdOwPvH1v8AOpzO
 1F8TvW92H2KsatP9/gfICqXT1dOucyXTFc2dTcRLqvcerH7FjInFXiyHd60kP0vf2VFflo
 GUvG/kIB+vChJjvWN5oAxlXYVYoOeZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-Nbn_tCUOMCefLRrk3AlI4Q-1; Mon, 13 Sep 2021 09:25:02 -0400
X-MC-Unique: Nbn_tCUOMCefLRrk3AlI4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 960DE19057A2;
 Mon, 13 Sep 2021 13:25:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55E8F6A90C;
 Mon, 13 Sep 2021 13:24:59 +0000 (UTC)
Date: Mon, 13 Sep 2021 14:24:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v2 1/3] monitor: Add HMP and QMP interfaces
Message-ID: <YT9RKFjKyI+FThq0@redhat.com>
References: <20210910102258.46648-1-yang.zhong@intel.com>
 <20210910102258.46648-2-yang.zhong@intel.com>
 <YTthmPn2KGcfNX21@redhat.com> <YT8bboSgYfWJP9kh@redhat.com>
 <4ae8c563-9b44-d234-eb01-a61000d01439@redhat.com>
 <YT9KbTrZv7XpvNbN@redhat.com>
 <20210913125228.GA27608@yangzhon-Virtual>
MIME-Version: 1.0
In-Reply-To: <20210913125228.GA27608@yangzhon-Virtual>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: pbonzini@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 08:52:28PM +0800, Yang Zhong wrote:
> On Mon, Sep 13, 2021 at 01:56:13PM +0100, Daniel P. Berrangé wrote:
> > On Mon, Sep 13, 2021 at 02:48:37PM +0200, Paolo Bonzini wrote:
> > > On 13/09/21 11:35, Daniel P. Berrangé wrote:
> > > > >    g_autoptr(Error) err = NULL
> > > > I was mistaken here - Error shouldn't use g_autoptr, just
> > > > 
> > > >     Error err = NULL;
> > > > 
> > > > > > +    SGXInfo *info = qmp_query_sgx(NULL);
> > > > > Pass in &err not NULL;
> > > > > 
> > > > > Also  declare it with  'g_autoptr(SGXInfo) info = ...'
> > > > > 
> > > > > And then
> > > > > 
> > > > >     if (err) {
> > > > >        monitor_printf(mon, "%s\n", error_get_pretty(err);
> > > > Then use the simpler:
> > > > 
> > > >      error_report_err(err);
> > > 
> > > Indeed.
> > > 
> > > That said, more long term (but this is something Coccinelle could help with)
> > > perhaps error_report_err should not free the error, and instead we should
> > > use g_autoptr(Error) in the callers.  I don't like functions that do not
> > > have free in their name and yet free a pointer...
> > 
> > Yes, this error_report_err surprises me every 6 months when I
> > come to deal with it. So I think using g_autoptr would be a
> > nice replacement, with no additional burden in terms of lines
> > of code in callers too.
> >
> 
>   Do we need call qapi_free_SGXInfo(info) here?
> 
>   In previous code design, the code like below:
> 
>   SGXInfo *info = qmp_query_sgx(&err);
>   ......
>   qapi_free_SGXInfo(info);

I suggested "g_autoptr(SGXInfo) info" for the declaration to avoid
the need for qapi_free_SGXInfo calls


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


