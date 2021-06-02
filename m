Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FAF397F9B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:42:25 +0200 (CEST)
Received: from localhost ([::1]:36800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHlw-00032A-Ea
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loHl8-0002FA-G8
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:41:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loHl6-0000kn-MV
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622605291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gk5NfyARHfUptZ2Z0H199/YFdsxj0zh4wGs09gHWl+g=;
 b=iZDKOaPdEmadWWSAwCg3/doPjQhw/hdA7BJeBAG9/QqwScjrjZ+Z2xYp/17Xz5f6SBcMg2
 G19OVZJTEFELhNJ/MTdt0uRWZWiRGBDnNaL2N4Mb43N+YJ1FuziaQfeMbyriHRv0m0ayYh
 6aRt4jbdP4MGvWNewn2AzW6aeX3ZGn8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-C8wg2kmsPeGflq4igNB7TA-1; Tue, 01 Jun 2021 23:41:28 -0400
X-MC-Unique: C8wg2kmsPeGflq4igNB7TA-1
Received: by mail-wr1-f69.google.com with SMTP id
 m27-20020a056000025bb0290114d19822edso407592wrz.21
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 20:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gk5NfyARHfUptZ2Z0H199/YFdsxj0zh4wGs09gHWl+g=;
 b=Cu8cwcEcrSw3ivIlImOeAvN3Y1rNYdfBKsc3BhtvEnitIB5rQ1iYYEe39JNMwOX59s
 YHk0AkwQQV4grbI9OXEWX0THouMThTr4PiSrMn7HzrFYsT2u812iQWdDUrxEpuHbRwAC
 chb6h+LZVTR3ani4d48eP4DG/GCX9eYJr4xddaeD66q9D5PHNnSaRuqUzZoSvEwDI1BM
 655Pc/85KNGrJtrxhKQsnPCumD6GN7EuBTMVeM4lqvIbWBMhiPqv112AXxsC5kJSgo9+
 mnRdk4ShJmuMo0ZaPp0N9C5p65x3Lv2bQlhHhiqjCQJRD1gTdJn8wksoGKTzGR8KvRUv
 HVIw==
X-Gm-Message-State: AOAM530e3nhAwHFRMTpkgZs5XPrXjTOMpejVjhPPx2tUE5/d8fcXJe1a
 F3a76Fxo88jZThS76Kfyk1Ji1N6jHd7OWUUAupufKvvpORnP4Sf9oWo12+QBMxl+5WryxvfjqgR
 xpe7iPpzNciuxWWY=
X-Received: by 2002:adf:fb90:: with SMTP id a16mr27331206wrr.360.1622605287816; 
 Tue, 01 Jun 2021 20:41:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC41U3w8ROMzBt9O6ZJRc8+hwsLgjYQWrwgueGYgAguWVy0Fo/4iM/uqu3SBQWy8zU0h6LwQ==
X-Received: by 2002:adf:fb90:: with SMTP id a16mr27331183wrr.360.1622605287505; 
 Tue, 01 Jun 2021 20:41:27 -0700 (PDT)
Received: from thuth.remote.csb (p5791de31.dip0.t-ipconnect.de.
 [87.145.222.49])
 by smtp.gmail.com with ESMTPSA id b135sm1231857wmb.5.2021.06.01.20.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 20:41:27 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] vhost-user-blk-test: fix Coverity open(2) false
 positives
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210601155755.216949-1-stefanha@redhat.com>
 <20210601155755.216949-2-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <749babce-e80d-9950-c8de-689cf27b5807@redhat.com>
Date: Wed, 2 Jun 2021 05:41:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210601155755.216949-2-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/06/2021 17.57, Stefan Hajnoczi wrote:
> Coverity checks that the file descriptor return value of open(2) is
> checked and used. Normally this is helpful in identifying real bugs but
> vhost-user-blk-test opens /dev/null as stdin and stdout after fork.
> 
> In this case we don't need to look at the return value because these
> open(2) calls cannot fail in any reasonable environment. We already know
> their return values ahead of time since we closed stdin and stdout
> previously. open(2) is guaranteed to pick the lowest available fd
> number.
> 
> Silence Coverity by introducing code that checks what we already know to
> be true.
> 
> ** CID 1453270:  Resource leaks  (RESOURCE_LEAK)
> /qemu/tests/qtest/vhost-user-blk-test.c: 920 in start_vhost_user_blk()
> 
> ________________________________________________________________________________________________________
> *** CID 1453270:  Resource leaks  (RESOURCE_LEAK)
> /qemu/tests/qtest/vhost-user-blk-test.c: 920 in start_vhost_user_blk()
> 914              * Close standard file descriptors so tap-driver.pl pipe detects when
> 915              * our parent terminates.
> 916              */
> 917             close(0);
> 918             close(1);
> 919             open("/dev/null", O_RDONLY);
>>>>      CID 1453270:  Resource leaks  (RESOURCE_LEAK)
>>>>      Ignoring handle opened by "open("/dev/null", 1)" leaks it.
> 920             open("/dev/null", O_WRONLY);
> 921
> 922             execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
> 923             exit(1);
> 924         }
> 925         g_string_free(storage_daemon_command, true);
> 
> ** CID 1453269:  Error handling issues  (NEGATIVE_RETURNS)
> /qemu/tests/qtest/vhost-user-blk-test.c: 829 in create_listen_socket()
> 
> ________________________________________________________________________________________________________
> *** CID 1453269:  Error handling issues  (NEGATIVE_RETURNS)
> /qemu/tests/qtest/vhost-user-blk-test.c: 829 in create_listen_socket()
> 823         char *path;
> 824
> 825         /* No race because our pid makes the path unique */
> 826         path = g_strdup_printf("/tmp/qtest-%d-sock.XXXXXX", getpid());
> 827         tmp_fd = mkstemp(path);
> 828         g_assert_cmpint(tmp_fd, >=, 0);
>>>>      CID 1453269:  Error handling issues  (NEGATIVE_RETURNS)
>>>>      "tmp_fd" is passed to a parameter that cannot be negative.
> 829         close(tmp_fd);
> 830         unlink(path);
> 831
> 832         *fd = qtest_socket_server(path);
> 833         g_test_queue_destroy(destroy_file, path);
> 834         return path;
> 
> ** CID 1453268:    (CHECKED_RETURN)
> /qemu/tests/qtest/vhost-user-blk-test.c: 920 in start_vhost_user_blk()
> /qemu/tests/qtest/vhost-user-blk-test.c: 919 in start_vhost_user_blk()
> 
> ________________________________________________________________________________________________________
> *** CID 1453268:    (CHECKED_RETURN)
> /qemu/tests/qtest/vhost-user-blk-test.c: 920 in start_vhost_user_blk()
> 914              * Close standard file descriptors so tap-driver.pl pipe detects when
> 915              * our parent terminates.
> 916              */
> 917             close(0);
> 918             close(1);
> 919             open("/dev/null", O_RDONLY);
>>>>      CID 1453268:    (CHECKED_RETURN)
>>>>      Calling "open("/dev/null", 1)" without checking return value. This library function may fail and return an error code. [Note: The source code implementation of the function has been overridden by a builtin model.]
> 920             open("/dev/null", O_WRONLY);
> 921
> 922             execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
> 923             exit(1);
> 924         }
> 925         g_string_free(storage_daemon_command, true);
> /qemu/tests/qtest/vhost-user-blk-test.c: 919 in start_vhost_user_blk()
> 913             /*
> 914              * Close standard file descriptors so tap-driver.pl pipe detects when
> 915              * our parent terminates.
> 916              */
> 917             close(0);
> 918             close(1);
>>>>      CID 1453268:    (CHECKED_RETURN)
>>>>      Calling "open("/dev/null", 0)" without checking return value. This library function may fail and return an error code. [Note: The source code implementation of the function has been overridden by a builtin model.]
> 919             open("/dev/null", O_RDONLY);
> 920             open("/dev/null", O_WRONLY);
> 921
> 922             execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
> 923             exit(1);
> 924         }
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   tests/qtest/vhost-user-blk-test.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
> index 8796c74ca4..c5c4667759 100644
> --- a/tests/qtest/vhost-user-blk-test.c
> +++ b/tests/qtest/vhost-user-blk-test.c
> @@ -910,14 +910,18 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
>                      storage_daemon_command->str);
>       pid_t pid = fork();
>       if (pid == 0) {
> +        int fd;
> +
>           /*
>            * Close standard file descriptors so tap-driver.pl pipe detects when
>            * our parent terminates.
>            */
>           close(0);
> +        fd = open("/dev/null", O_RDONLY);
> +        g_assert_cmpint(fd, ==, 0);
>           close(1);
> -        open("/dev/null", O_RDONLY);
> -        open("/dev/null", O_WRONLY);
> +        fd = open("/dev/null", O_WRONLY);
> +        g_assert_cmpint(fd, ==, 1);
>   
>           execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
>           exit(1);
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


