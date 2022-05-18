Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3592952B52A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 10:55:02 +0200 (CEST)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFSP-0007Cf-5J
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 04:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrFJt-00052k-NP
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrFJr-0001VU-B8
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652863570;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Y8L6JUURcwmqVXtDrsHlccyi4Flh4wvlL/Le5ef1Qnc=;
 b=acdQWb+8iGPaLM2U8oD8melT+vID5Em0MqP3GCyCTVK/4rDgNG5yf3RsjfTrEdWJYy6C4R
 cgjwKr1v9WwNQyZeFJQ3kHGW+UygsxX76zv32iGSE15nvKwoUZVvRXtaCErzKiamSLwsdC
 f9LMdUDOYrqQh7Keyn+bBMMDuVFkRJk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-6VQQ_AXpPjK6lbN081BKwg-1; Wed, 18 May 2022 04:46:09 -0400
X-MC-Unique: 6VQQ_AXpPjK6lbN081BKwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1099A1C01B27
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 08:46:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D4B540C1421;
 Wed, 18 May 2022 08:46:08 +0000 (UTC)
Date: Wed, 18 May 2022 09:46:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: leobras@redhat.com, qemu-devel@nongnu.org
Subject: Re: New Defects reported by Coverity Scan for QEMU
Message-ID: <YoSyTdAdsQW6Xvp6@redhat.com>
References: <628400a4166bb_1049492b2274ab39a479512@prd-scan-dashboard-0.mail>
 <YoSrEDNCFlF5V+3/@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YoSrEDNCFlF5V+3/@work-vm>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 18, 2022 at 09:15:12AM +0100, Dr. David Alan Gilbert wrote:
> Hi Dan, Leo,
>   There are a few coverity warns from that last series:
> 
> 
> Two moans about not checking mkdir in the tls tests:

Those mkdir()s can just be wrapped with an assert()

> > ** CID 1488871:  Error handling issues  (CHECKED_RETURN)
> > /qemu/tests/qtest/migration-test.c: 782 in test_migrate_tls_x509_start_common()
> > 
> > 
> > ________________________________________________________________________________________________________
> > *** CID 1488871:  Error handling issues  (CHECKED_RETURN)
> > /qemu/tests/qtest/migration-test.c: 782 in test_migrate_tls_x509_start_common()
> > 776         data->servercert = g_strdup_printf("%s/server-cert.pem", data->workdir);
> > 777         if (args->clientcert) {
> > 778             data->clientkey = g_strdup_printf("%s/client-key.pem", data->workdir);
> > 779             data->clientcert = g_strdup_printf("%s/client-cert.pem", data->workdir);
> > 780         }
> > 781     
> > >>>     CID 1488871:  Error handling issues  (CHECKED_RETURN)
> > >>>     Calling "mkdir(data->workdir, 448U)" without checking return value. This library function may fail and return an error code.
> > 782         mkdir(data->workdir, 0700);
> > 783     
> > 784         test_tls_init(data->keyfile);
> > 785         g_assert(link(data->keyfile, data->serverkey) == 0);
> > 786         if (args->clientcert) {
> > 787             g_assert(link(data->keyfile, data->clientkey) == 0);
> > 
> > ** CID 1488870:    (CHECKED_RETURN)
> > /qemu/tests/qtest/migration-test.c: 677 in test_migrate_tls_psk_start_common()
> > /qemu/tests/qtest/migration-test.c: 670 in test_migrate_tls_psk_start_common()
> > 
> > 
> > ________________________________________________________________________________________________________
> > *** CID 1488870:    (CHECKED_RETURN)
> > /qemu/tests/qtest/migration-test.c: 677 in test_migrate_tls_psk_start_common()
> > 671         test_tls_psk_init(data->pskfile);
> > 672     
> > 673         if (mismatch) {
> > 674             data->workdiralt = g_strdup_printf("%s/tlscredspskalt0", tmpfs);
> > 675             data->pskfilealt = g_strdup_printf("%s/%s", data->workdiralt,
> > 676                                                QCRYPTO_TLS_CREDS_PSKFILE);
> > >>>     CID 1488870:    (CHECKED_RETURN)
> > >>>     Calling "mkdir(data->workdiralt, 448U)" without checking return value. This library function may fail and return an error code.
> > 677             mkdir(data->workdiralt, 0700);
> > 678             test_tls_psk_init_alt(data->pskfilealt);
> > 679         }
> > 680     
> > 681         rsp = wait_command(from,
> > 682                            "{ 'execute': 'object-add',"
> > /qemu/tests/qtest/migration-test.c: 670 in test_migrate_tls_psk_start_common()
> > 664             g_new0(struct TestMigrateTLSPSKData, 1);
> > 665         QDict *rsp;
> > 666     
> > 667         data->workdir = g_strdup_printf("%s/tlscredspsk0", tmpfs);
> > 668         data->pskfile = g_strdup_printf("%s/%s", data->workdir,
> > 669                                         QCRYPTO_TLS_CREDS_PSKFILE);
> > >>>     CID 1488870:    (CHECKED_RETURN)
> > >>>     Calling "mkdir(data->workdir, 448U)" without checking return value. This library function may fail and return an error code.
> > 670         mkdir(data->workdir, 0700);
> > 671         test_tls_psk_init(data->pskfile);
> > 672     
> > 673         if (mismatch) {
> > 674             data->workdiralt = g_strdup_printf("%s/tlscredspskalt0", tmpfs);
> > 675             data->pskfilealt = g_strdup_printf("%s/%s", data->workdiralt,
> > 
> > ** CID 1488869:  Insecure data handling  (TAINTED_SCALAR)
> > /qemu/io/channel-socket.c: 716 in qio_channel_socket_flush()
> 
> 
> 
> This one is more curious:
> > *** CID 1488869:  Insecure data handling  (TAINTED_SCALAR)
> > /qemu/io/channel-socket.c: 716 in qio_channel_socket_flush()
> > 710         int ret = 1;
> > 711     
> > 712         msg.msg_control = control;
> > 713         msg.msg_controllen = sizeof(control);
> > 714         memset(control, 0, sizeof(control));
> > 715     
> > >>>     CID 1488869:  Insecure data handling  (TAINTED_SCALAR)
> > >>>     Using tainted variable "sioc->zero_copy_sent" as a loop boundary.
> > 716         while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
> > 717             received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> > 718             if (received < 0) {
> > 719                 switch (errno) {
> > 720                 case EAGAIN:
> > 721                     /* Nothing on errqueue, wait until something is available */
> 
> it's not clear to me why it considers that 'insecure'; is that because
> it's using values returned by the recvmsg ???

Yes, IIUC, coverity is applying he Perl-like concept of data
tainting here. The 'zero_copy_sent' field is incremented based
on the data from 'struct sock_extended_err' acquired from the
CMSG_DATA on a socket.

I expect Coverity does not understand that although the socket
peer is certainly untrustworthy, the CMSG_DATA we're processing
originated in the kernel and so that IS trustworthy.

Probably the only additional sanity checking we could do would be
to validate that we've not been given bogus data from the kenrel
that would result in a negative sent count.

     if ((serr->ee_info + 1) > serr->ee_data) {
         error_setg(errp, "Invalid sent packet count from kernel")
	 return -1;
     }

Perhaps that's what coverity wants us todo ? In practice that would
merely be protecting against kernel programming bug.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


