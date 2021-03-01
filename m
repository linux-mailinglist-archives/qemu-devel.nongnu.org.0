Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AEA3283C4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:27:41 +0100 (CET)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlOW-0008Or-O2
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lGlLU-0006JV-Hm
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:24:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lGlLS-0007XF-Fk
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614615869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufIGz8zsERjlHgucx+AlbhWghY8mUpVKhurQ6nkQ22I=;
 b=Tw71emHLMVE1aUipDIXlpgze3R5kmGY9JbtesWQ9LmtSxWvLd2yuA4PnKRcPD2HciryfOL
 UCMph1dFfs14JLsh4NipZ4HafjpF1o9oFmtyioM5IKAf8k4at3yB8h8VuUbvpDhQGfl1oj
 dStAKCiZBcFm0KBqZBEdvJz377nsNoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-zljV_tNcN7qdfvnfNSSWoQ-1; Mon, 01 Mar 2021 11:24:15 -0500
X-MC-Unique: zljV_tNcN7qdfvnfNSSWoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7173E1009618;
 Mon,  1 Mar 2021 16:24:14 +0000 (UTC)
Received: from localhost (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD5935D9E2;
 Mon,  1 Mar 2021 16:24:10 +0000 (UTC)
Date: Mon, 1 Mar 2021 16:24:09 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] qemu-storage-daemon: add --pidfile option
Message-ID: <20210301162409.GA30079@redhat.com>
References: <20210301160857.130478-1-stefanha@redhat.com>
 <YD0TM9/myXkdobPf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YD0TM9/myXkdobPf@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=rjones@redhat.com;
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
Cc: afrosi@redhat.com, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 04:15:47PM +0000, Daniel P. Berrangé wrote:
> On Mon, Mar 01, 2021 at 04:08:57PM +0000, Stefan Hajnoczi wrote:
> > Daemons often have a --pidfile option where the pid is written to a file
> > so that scripts can stop the daemon by sending a signal.
> > 
> > The pid file also acts as a lock to prevent multiple instances of the
> > daemon from launching for a given pid file.
> > 
> > QEMU, qemu-nbd, qemu-ga, virtiofsd, and qemu-pr-helper all support the
> > --pidfile option. Add it to qemu-storage-daemon too.
> > 
> > Reported-by: Richard W.M. Jones <rjones@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  docs/tools/qemu-storage-daemon.rst   | 10 ++++++++++
> >  storage-daemon/qemu-storage-daemon.c | 29 ++++++++++++++++++++++++++++
> >  2 files changed, 39 insertions(+)
> > 
> > diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
> > index f63627eaf6..8f4ab16ffc 100644
> > --- a/docs/tools/qemu-storage-daemon.rst
> > +++ b/docs/tools/qemu-storage-daemon.rst
> > @@ -118,6 +118,16 @@ Standard options:
> >    List object properties with ``<type>,help``. See the :manpage:`qemu(1)`
> >    manual page for a description of the object properties.
> >  
> > +.. option:: --pidfile PATH
> > +
> > +  is the path to a file where the daemon writes its pid. This allows scripts to
> > +  stop the daemon by sending a signal::
> > +
> > +    $ kill -SIGTERM $(<path/to/qsd.pid)
> > +
> > +  A file lock is applied to the file so only one instance of the daemon can run
> > +  with a given pid file path. The daemon unlinks its pid file when terminating.
> 
> Usually a pidfile wants to have some explicit synchronization rules
> defined. AFAICS, qsd doesn't have a --daemonize option to sync against.
> If we're using the FD passing trick for the monitor, however, we want
> a guarantee that the pidfile is written before the monitor accepts the
> first client.
> 
> IOW, the parent process needs to know that once it has done the QMP
> handshake, there is guaranteed tobe a pidfile present, or if the
> QMP handshake fails, then the app is guaranteed to have quit.
> 
> IIUC, this impl should be ok in this respect, because we won't process
> the QMP handdshake until the main loop runs, at which point the pidfile
> is present. So we just need to document that the pidfile is guaranteed
> to be written by the time QMP is active.

I'm not sure if I follow this exactly, but from my point of view I'd
like to know that:

(1) If we're using --nbd-server addr.type=inet|unix then the PID file
must not be created until the socket has been created and is
listening.  Here I mean the NBD socket, but the same would apply to
the QMP socket or any other listening socket.  This allows you to do
scripting sanely (qemu-storage-daemon ... &) without arbitrary sleeps.

(2) If we're using the FD passing trick instead, we don't care and
would probably not use the --pidfile option anyway (since we have the
PID from calling fork).

Rich.

> 
> > +
> >  Examples
> >  --------
> >  Launch the daemon with QMP monitor socket ``qmp.sock`` so clients can execute
> > diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> > index 9021a46b3a..011ae49ac3 100644
> > --- a/storage-daemon/qemu-storage-daemon.c
> > +++ b/storage-daemon/qemu-storage-daemon.c
> > @@ -59,6 +59,7 @@
> >  #include "sysemu/runstate.h"
> >  #include "trace/control.h"
> >  
> > +static const char *pid_file;
> >  static volatile bool exit_requested = false;
> >  
> >  void qemu_system_killed(int signal, pid_t pid)
> > @@ -126,6 +127,7 @@ enum {
> >      OPTION_MONITOR,
> >      OPTION_NBD_SERVER,
> >      OPTION_OBJECT,
> > +    OPTION_PIDFILE,
> >  };
> >  
> >  extern QemuOptsList qemu_chardev_opts;
> > @@ -164,6 +166,7 @@ static void process_options(int argc, char *argv[])
> >          {"monitor", required_argument, NULL, OPTION_MONITOR},
> >          {"nbd-server", required_argument, NULL, OPTION_NBD_SERVER},
> >          {"object", required_argument, NULL, OPTION_OBJECT},
> > +        {"pidfile", required_argument, NULL, OPTION_PIDFILE},
> >          {"trace", required_argument, NULL, 'T'},
> >          {"version", no_argument, NULL, 'V'},
> >          {0, 0, 0, 0}
> > @@ -275,6 +278,9 @@ static void process_options(int argc, char *argv[])
> >                  qobject_unref(args);
> >                  break;
> >              }
> > +        case OPTION_PIDFILE:
> > +            pid_file = optarg;
> > +            break;
> >          default:
> >              g_assert_not_reached();
> >          }
> > @@ -285,6 +291,27 @@ static void process_options(int argc, char *argv[])
> >      }
> >  }
> >  
> > +static void pid_file_cleanup(void)
> > +{
> > +    unlink(pid_file);
> > +}
> > +
> > +static void pid_file_init(void)
> > +{
> > +    Error *err = NULL;
> > +
> > +    if (!pid_file) {
> > +        return;
> > +    }
> > +
> > +    if (!qemu_write_pidfile(pid_file, &err)) {
> > +        error_reportf_err(err, "cannot create PID file: ");
> > +        exit(EXIT_FAILURE);
> > +    }
> > +
> > +    atexit(pid_file_cleanup);
> > +}
> > +
> >  int main(int argc, char *argv[])
> >  {
> >  #ifdef CONFIG_POSIX
> > @@ -312,6 +339,8 @@ int main(int argc, char *argv[])
> >      qemu_init_main_loop(&error_fatal);
> >      process_options(argc, argv);
> >  
> > +    pid_file_init();
> > +
> >      while (!exit_requested) {
> >          main_loop_wait(false);
> >      }
> > -- 
> > 2.29.2
> > 
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


