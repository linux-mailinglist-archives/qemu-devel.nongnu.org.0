Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98D91D47D0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 10:10:55 +0200 (CEST)
Received: from localhost ([::1]:38782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZVQk-0005X4-Rh
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 04:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jZVPq-0004u8-DS
 for qemu-devel@nongnu.org; Fri, 15 May 2020 04:09:58 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58169
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jZVPo-0003yE-GF
 for qemu-devel@nongnu.org; Fri, 15 May 2020 04:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589530195;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cxScrQMVJjQugTiwqI4eTNK6QaoqWsOYvOf+B5DhLfg=;
 b=cvV9hgKhuZs7mXhGqLZc5nd3EBjZnSQFr26MJjXOo3Fu3Jfl51QufeQvdHj0zwMLV+U8u5
 P7acvrP9hSfRcfOkdByt28QAhzsLDHz2e9k1fdmSAfI0fjykfr3I0JELJ2SSsISBiU+F+F
 cfRtLQTsq/9TFGdIRuJFL+I5bT+GFaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-jfZRdzWvOyerNuTOPK9TQw-1; Fri, 15 May 2020 04:09:53 -0400
X-MC-Unique: jfZRdzWvOyerNuTOPK9TQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7432E80B713;
 Fri, 15 May 2020 08:09:52 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C17678B20;
 Fri, 15 May 2020 08:09:37 +0000 (UTC)
Date: Fri, 15 May 2020 09:09:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Subject: Re: [PATCH v4 2/3] tests/util-sockets: add abstract unix socket cases
Message-ID: <20200515080934.GB1300305@redhat.com>
References: <20200515043235.32189-1-zxq_yx_007@163.com>
 <20200515043235.32189-3-zxq_yx_007@163.com>
MIME-Version: 1.0
In-Reply-To: <20200515043235.32189-3-zxq_yx_007@163.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_EXCESS_BASE64=0.979, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 armbru@redhat.com, kraxel@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 15, 2020 at 12:32:34PM +0800, xiaoqiang zhao wrote:
> add cases to test tight and non-tight for abstract address type
> 
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  tests/test-util-sockets.c | 91 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c
> index 5fd947c7bf..c21a90634a 100644
> --- a/tests/test-util-sockets.c
> +++ b/tests/test-util-sockets.c
> @@ -227,6 +227,92 @@ static void test_socket_fd_pass_num_nocli(void)
>      g_free(addr.u.fd.str);
>  }
>  
> +static gchar *abstract_sock_name;
> +
> +static gpointer unix_server_thread_func(gpointer user_data)
> +{
> +    SocketAddress addr;
> +    Error *err = NULL;
> +    int fd = -1;
> +    int connfd = -1;
> +    struct sockaddr_un un;
> +    socklen_t len = sizeof(un);
> +
> +    addr.type = SOCKET_ADDRESS_TYPE_UNIX;
> +    addr.u.q_unix.path = abstract_sock_name;
> +    addr.u.q_unix.tight = user_data != NULL;
> +    addr.u.q_unix.abstract = true;
> +
> +    fd = socket_listen(&addr, 1, &err);
> +    g_assert_cmpint(fd, >=, 0);
> +    g_assert(fd_is_socket(fd));
> +
> +    connfd = accept(fd, (struct sockaddr *)&un, &len);
> +    g_assert_cmpint(connfd, !=, -1);
> +
> +    close(fd);
> +
> +    return NULL;
> +}
> +
> +static gpointer unix_client_thread_func(gpointer user_data)
> +{
> +    SocketAddress addr;
> +    Error *err = NULL;
> +    int fd = -1;
> +
> +    addr.type = SOCKET_ADDRESS_TYPE_UNIX;
> +    addr.u.q_unix.path = abstract_sock_name;
> +    addr.u.q_unix.tight = user_data != NULL;
> +    addr.u.q_unix.abstract = true;
> +
> +    fd = socket_connect(&addr, &err);
> +
> +    g_assert_cmpint(fd, >=, 0);
> +
> +    close(fd);
> +
> +    return NULL;
> +}
> +
> +static void test_socket_unix_abstract_good(void)
> +{
> +

Extra blank line

> +    GRand *r = g_rand_new();
> +
> +    abstract_sock_name = g_strdup_printf("unix-%d-%d", getpid(),
> +    g_rand_int_range(r, 100, 1000));

This g_rand_int_range should be indented more 

> +
> +    /* non tight socklen serv and cli */
> +    GThread *serv = g_thread_new("abstract_unix_server",
> +                                 unix_server_thread_func,
> +                                 NULL);
> +
> +    sleep(1);
> +
> +    GThread *cli = g_thread_new("abstruct_unix_client",

s/abstruct/abstract/

> +                                unix_client_thread_func,
> +                                NULL);
> +
> +    g_thread_join(cli);
> +    g_thread_join(serv);
> +
> +    /* tight socklen serv and cli */
> +    serv = g_thread_new("abstract_unix_server",
> +                        unix_server_thread_func,
> +                        (gpointer)1);
> +
> +    sleep(1);
> +
> +    cli = g_thread_new("abstruct_unix_client",

s/abstruct/abstract/

> +                       unix_client_thread_func,
> +                       (gpointer)1);
> +
> +    g_thread_join(cli);
> +    g_thread_join(serv);
> +
> +    g_free(abstract_sock_name);
> +}

Everything above here needs to be wrapped in ifdef __linux__ otherwise
the compiler is liable to complain about unused static functions

>  
>  int main(int argc, char **argv)
>  {
> @@ -265,6 +351,11 @@ int main(int argc, char **argv)
>                          test_socket_fd_pass_num_nocli);
>      }
>  
> +#ifdef __linux__
> +        g_test_add_func("/util/socket/unix-abstract/good",
> +                        test_socket_unix_abstract_good);

This is indented a little too much

> +#endif
> +
>  end:
>      return g_test_run();
>  }
> -- 
> 2.17.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


