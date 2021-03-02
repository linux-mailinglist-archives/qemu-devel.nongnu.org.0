Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB1332AA62
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:31:24 +0100 (CET)
Received: from localhost ([::1]:38010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAjr-0000tb-P1
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHAAB-0007PV-Kn
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:54:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHAA9-0007Ri-10
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:54:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614711268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m5NjC8VJIWKJTffwI01mTbTNZI6EGOzt1aAtiTIpY6M=;
 b=YIL5q3tmq1gghrj3NeReXHdsZRh9LCNUzTtQZH0YEjdhSedpxRHFeflJfgxO6zzhm7buIb
 +2zaHK5mYqutNg4Dm5uXgZQN3fhwei5EsJL+qTYAyplREub4el8keC1Xi3LgnLC9z5YarQ
 42DbVdxdsUIKN9bOvhhEuvj5nRpqcGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-uu-1su85Mz6S6OyO71KPdA-1; Tue, 02 Mar 2021 13:54:21 -0500
X-MC-Unique: uu-1su85Mz6S6OyO71KPdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54EE9107ACE6;
 Tue,  2 Mar 2021 18:54:20 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2787F60BFA;
 Tue,  2 Mar 2021 18:54:11 +0000 (UTC)
Date: Tue, 2 Mar 2021 19:54:09 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 19/31] qapi/qom: QAPIfy object-add
Message-ID: <20210302185409.GK5527@merkur.fritz.box>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-20-kwolf@redhat.com>
 <fdeb785f-4eef-e216-c4ab-f86147d03671@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fdeb785f-4eef-e216-c4ab-f86147d03671@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.02.2021 um 22:18 hat Eric Blake geschrieben:
> On 2/24/21 7:52 AM, Kevin Wolf wrote:
> > This converts object-add from 'gen': false to the ObjectOptions QAPI
> > type. As an immediate benefit, clients can now use QAPI schema
> > introspection for user creatable QOM objects.
> > 
> > It is also the first step towards making the QAPI schema the only
> > external interface for the creation of user creatable objects. Once all
> > other places (HMP and command lines of the system emulator and all
> > tools) go through QAPI, too, some object implementations can be
> > simplified because some checks (e.g. that mandatory options are set) are
> > already performed by QAPI, and in another step, QOM boilerplate code
> > could be generated from the schema.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  qapi/qom.json                        | 11 +----------
> >  include/qom/object_interfaces.h      |  7 -------
> >  hw/block/xen-block.c                 | 16 ++++++++--------
> >  monitor/misc.c                       |  2 --
> >  qom/qom-qmp-cmds.c                   | 25 +++++++++++++++++++++++--
> >  storage-daemon/qemu-storage-daemon.c |  2 --
> >  6 files changed, 32 insertions(+), 31 deletions(-)
> > 
> > +++ b/qapi/qom.json
> > @@ -839,13 +839,6 @@
> >  #
> >  # Create a QOM object.
> >  #
> > -# @qom-type: the class name for the object to be created
> > -#
> > -# @id: the name of the new object
> > -#
> > -# Additional arguments depend on qom-type and are passed to the backend
> > -# unchanged.
> > -#
> >  # Returns: Nothing on success
> >  #          Error if @qom-type is not a valid class name
> >  #
> > @@ -859,9 +852,7 @@
> >  # <- { "return": {} }
> >  #
> >  ##
> > -{ 'command': 'object-add',
> > -  'data': {'qom-type': 'str', 'id': 'str'},
> > -  'gen': false } # so we can get the additional arguments
> > +{ 'command': 'object-add', 'data': 'ObjectOptions', 'boxed': true }
> 
> So much more concise ;)  A grep for TYPE_USER_CREATABLE doesn't seem to
> turn up any *_class_init() functions that your earlier patches in the
> series missed, so I think you captured an accurate 1:1 mapping.  There
> is include/chardev/char.h with the comment about "TODO: eventually use
> TYPE_USER_CREATABLE" which may point to the next item to be added to
> ObjectOptions, but that's not for this series.
> 
> > +++ b/qom/qom-qmp-cmds.c
> 
> >  
> > -void qmp_object_add(QDict *qdict, QObject **ret_data, Error **errp)
> > +void qmp_object_add(ObjectOptions *options, Error **errp)
> >  {
> > -    user_creatable_add_dict(qdict, false, errp);
> > +    Visitor *v;
> > +    QObject *qobj;
> > +    QDict *props;
> > +    Object *obj;
> > +
> > +    v = qobject_output_visitor_new(&qobj);
> > +    visit_type_ObjectOptions(v, NULL, &options, &error_abort);
> > +    visit_complete(v, &qobj);
> > +    visit_free(v);
> 
> This part is nice...

It's not really, though.

We're going from ObjectOptions to QDict just to feed the QDict back into
a visitor. The QDict step feels unnecessary, but we don't have a visitor
that visits existing QAPI objects. I think it would be somewhat similar
to the clone visitor, but not exactly the same thing.

> > +
> > +    props = qobject_to(QDict, qobj);
> > +    qdict_del(props, "qom-type");
> > +    qdict_del(props, "id");
> 
> ...while this part makes it seem like we still have more cleanup to come
> later.  But hey, progress!

Ideally, I would like the whole function to look more or less like this:

void qmp_object_add(ObjectOptions *options, Error **errp)
{
    Visitor *v = qapi_object_visitor_new(options);
    Object *obj = user_creatable_add_type(v, errp);
    object_unref(obj);
    visit_free(v);
}

Can be done later (or never).

Kevin

> > +
> > +    v = qobject_input_visitor_new(QOBJECT(props));
> > +    obj = user_creatable_add_type(ObjectType_str(options->qom_type),
> > +                                  options->id, props, v, errp);
> > +    object_unref(obj);
> > +    visit_free(v);
> >  }
> >  
> 
> Once you address Paolo's comment, you can also add
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org


