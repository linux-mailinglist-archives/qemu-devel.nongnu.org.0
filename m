Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A6C39780D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:28:19 +0200 (CEST)
Received: from localhost ([::1]:41406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7Fa-0002J0-Jf
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lo7Ei-0001UX-JD
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:27:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lo7Eg-0002Xc-Oi
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622564842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXbbi2w1HOOZC3/0tVf8mG3BmAAs+be3OwWvDHO1KoQ=;
 b=PlWGnDteMmG1UZtGiDmnAz4Lk1gJdnKYIlALXYIMU1yH1CdWnsZwL3Nr6onLUF56wPavMf
 MMcGRJFwaLUhILlzsMIvW0RiAINVoBEww2HtY4tty9iOOd/8VC1XEeOGM+W3RnlzWWYhZl
 muxWs3GGkqJiLMuQvheN/APELnwyswQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-Fxi7ZZlfPMa0qO4muoF0aw-1; Tue, 01 Jun 2021 12:27:19 -0400
X-MC-Unique: Fxi7ZZlfPMa0qO4muoF0aw-1
Received: by mail-ed1-f70.google.com with SMTP id
 y18-20020a0564022712b029038ffac1995eso372128edd.12
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 09:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gXbbi2w1HOOZC3/0tVf8mG3BmAAs+be3OwWvDHO1KoQ=;
 b=gCD5wJIhRJ5uTiA6W7U5BpZQt2JiaaRX6fZvFm2jwBrfXJwRyGbd93pejsMG3FwLYb
 W2fzef09ooULKOCp/GODAiyvDCJrXyqoidDO+Heb5JwrtfNaP+JWAsl7Ugo+84D4dFB0
 JFHQcdnwLHpRcP66z0azYuRv4TXR/P3aCPiZqKIJbI4a6JayHpTRhEHme20MnaWzODI7
 jP7C7fcitNM8rzWOwfyp6sCgVMF17pbg8ZwogLV80vvQ+pO+TJKzvwgsBF+21Lp9fjjD
 8I3siw/hXtLl+6Cc2RjJECxd5jV8yiOxO7zum8q7wcq7V6zTSNen78bdoK8SkiwqzVrI
 FbKg==
X-Gm-Message-State: AOAM533CjUxWj5PiNg3UJaw07gk1jrlaFGG3c2RY/FJUtG+ltQ+IsMi6
 i7EcfCZpah65YgJ0Fsj9jGp3LknJ29kgMWbrupvFUO9arHw2AKb0w8uUPmh3KclRa+H4WMaWpW0
 aE3hOOufBMaag2iA=
X-Received: by 2002:a17:906:1982:: with SMTP id
 g2mr30514344ejd.184.1622564838075; 
 Tue, 01 Jun 2021 09:27:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDtXxsjKAotwFt/1x0LftRCAAdmyJwYe0aDUSC8RXp4BZBm8zn7uTtVLdJ7nFor4SZw7ycUg==
X-Received: by 2002:a17:906:1982:: with SMTP id
 g2mr30514323ejd.184.1622564837825; 
 Tue, 01 Jun 2021 09:27:17 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id g21sm8637494edb.92.2021.06.01.09.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 09:27:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] vhost-user-blk-test: fix Coverity open(2) false
 positives
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210601155755.216949-1-stefanha@redhat.com>
 <20210601155755.216949-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6f90aad7-d3a6-f86e-ea86-582c358c5deb@redhat.com>
Date: Tue, 1 Jun 2021 18:27:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601155755.216949-2-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 5:57 PM, Stefan Hajnoczi wrote:
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
>>>>     CID 1453270:  Resource leaks  (RESOURCE_LEAK)
>>>>     Ignoring handle opened by "open("/dev/null", 1)" leaks it.
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
>>>>     CID 1453269:  Error handling issues  (NEGATIVE_RETURNS)
>>>>     "tmp_fd" is passed to a parameter that cannot be negative.
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
>>>>     CID 1453268:    (CHECKED_RETURN)
>>>>     Calling "open("/dev/null", 1)" without checking return value. This library function may fail and return an error code. [Note: The source code implementation of the function has been overridden by a builtin model.]
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
>>>>     CID 1453268:    (CHECKED_RETURN)
>>>>     Calling "open("/dev/null", 0)" without checking return value. This library function may fail and return an error code. [Note: The source code implementation of the function has been overridden by a builtin model.]
> 919             open("/dev/null", O_RDONLY);
> 920             open("/dev/null", O_WRONLY);
> 921
> 922             execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
> 923             exit(1);
> 924         }
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tests/qtest/vhost-user-blk-test.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


