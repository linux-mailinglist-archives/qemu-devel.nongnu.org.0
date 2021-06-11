Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92CB3A47DC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 19:25:01 +0200 (CEST)
Received: from localhost ([::1]:40606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrktw-0006Zi-Q6
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 13:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrkrH-00055w-JC
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:22:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrkrF-00050S-31
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:22:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623432132;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qrLrvuwvkI7WHkhudjxAxlmf2J3jp6cvtlHPFw2Mhmo=;
 b=cv8bGMX0jec38aLuLrhUJmfNpusCfEz4v+BHzt6voJauuuRH9RZkx5kGbbu0zGXPKd34go
 AzpDxIHOpYGI8zeiucbPnJH+qzXBmAl9fIWkqGr1HoSrqwHo5lzCtVWH9tBAxQnxkiHLuo
 yYtYrF31yRX+wabxECssdZYABjFVRFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-Wk7YDVxFNOy1bJSzFM7wcg-1; Fri, 11 Jun 2021 13:22:05 -0400
X-MC-Unique: Wk7YDVxFNOy1bJSzFM7wcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D38D7100C660;
 Fri, 11 Jun 2021 17:22:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-90.ams2.redhat.com [10.36.115.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A13C91007606;
 Fri, 11 Jun 2021 17:21:58 +0000 (UTC)
Date: Fri, 11 Jun 2021 18:21:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [RFC PATCH 4/5] qmp: Added qemu-ebpf-rss-path command.
Message-ID: <YMObs8hO4FTgXy91@redhat.com>
References: <20210609100457.142570-1-andrew@daynix.com>
 <20210609100457.142570-5-andrew@daynix.com>
 <20210611141552.ezkybuvewffln4dz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210611141552.ezkybuvewffln4dz@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, yuri.benditovich@daynix.com,
 yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 09:15:52AM -0500, Eric Blake wrote:
> On Wed, Jun 09, 2021 at 01:04:56PM +0300, Andrew Melnychenko wrote:
> > New qmp command to query ebpf helper.
> > It's crucial that qemu and helper are in sync and in touch.
> > Technically helper should pass eBPF fds that qemu may accept.
> > And different qemu's builds may have different eBPF programs and helpers.
> > Qemu returns helper that should "fit" to virtio-net.
> > 
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >  monitor/qmp-cmds.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
> >  qapi/misc.json     | 29 +++++++++++++++++
> >  2 files changed, 107 insertions(+)
> > 
> > diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> > index f7d64a6457..5dd2a58ea2 100644
> > --- a/monitor/qmp-cmds.c
> > +++ b/monitor/qmp-cmds.c
> > @@ -351,3 +351,81 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
> >          abort();
> >      }
> >  }
> > +
> > +#ifdef CONFIG_LINUX
> > +
> > +static const char *get_dirname(char *path)
> > +{
> > +    char *sep;
> > +
> > +    sep = strrchr(path, '/');
> > +    if (sep == path) {
> > +        return "/";
> > +    } else if (sep) {
> > +        *sep = 0;
> > +        return path;
> > +    }
> > +    return ".";
> > +}
> 
> Seems like this function is duplicating what glib should already be
> able to do.
> 
> > +
> > +static char *find_helper(const char *name)
> > +{
> > +    char qemu_exec[PATH_MAX];
> 
> Stack-allocating a PATH_MAX array for readlink() is poor practice.
> Better is to use g_file_read_link().
> 
> > +    const char *qemu_dir = NULL;
> > +    char *helper = NULL;
> > +
> > +    if (name == NULL) {
> > +        return NULL;
> > +    }
> > +
> > +    if (readlink("/proc/self/exe", qemu_exec, PATH_MAX) > 0) {
> > +        qemu_dir = get_dirname(qemu_exec);
> > +
> > +        helper = g_strdup_printf("%s/%s", qemu_dir, name);
> > +        if (access(helper, F_OK) == 0) {
> > +            return helper;
> > +        }
> > +        g_free(helper);
> > +    }
> > +
> > +    helper = g_strdup_printf("%s/%s", CONFIG_QEMU_HELPERDIR, name);
> 
> Could we use a compile-time determination of where we were (supposed)
> to be installed, and therefore where our helper should be installed,
> rather than the dynamic /proc/self/exe munging?

Yeah I think avoiding /proc/self/exe is desirable, because I can
imagine scenarios where this can lead to picking the wrong helper.
Better to always use the compile time install directory.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


