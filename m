Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A4960F713
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 14:21:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo1rC-0000gN-I8; Thu, 27 Oct 2022 08:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo1r5-0000Wa-2f
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:19:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo1r2-0003cf-M2
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666873163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8r6D4VdQUjTMGI2J1by61r+YA/MS2mUaapmIAFa5lc=;
 b=M5KVjvAUfhWZa5uMFKb1UmUHpYZHZ9k8L2E2KgMlLEmMEftqIxk5k/xgGDir1WcdJw5Rl3
 vr5aBVXK/lkhvoXnty8Q2XnEeZCIbFL007xiNaQZ66Hsu2P+8D+BiZL1pj6j72p0KVEn7X
 ttQDg+E7yedwFm+1wIiMWUH8dmXiZFo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-184-5iXWgs3mNjSQ0JjTwkvyuA-1; Thu, 27 Oct 2022 08:19:18 -0400
X-MC-Unique: 5iXWgs3mNjSQ0JjTwkvyuA-1
Received: by mail-wr1-f69.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so321815wrg.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 05:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j8r6D4VdQUjTMGI2J1by61r+YA/MS2mUaapmIAFa5lc=;
 b=7C1+bQRRLSydc4PbITNBT4pOB1hIop0khSPKaJ4KfmS7M1xczxbYQbVIx51buHdvM/
 PkflH0TS9A10aRgjnqEzAqG32qII5HgQLVIipFjH+VY+oTGvL4FueDvVcHchUwmrsZv1
 wD1JZLEGCz1gR5AadPvLm/Nh/HepM8crT+16A0OydsSMBN5CgeZ5C9CM+PZkqJSTXKu1
 OCwRTrtOUmim0mpM5yu+LnYeTMofywOp3BAqXgEDjRKwWoJExTaNX4rtOZDSrV8sR/ft
 GqKEvQvUZUXN9jIGYUHU2GTtswZzQv+l4/ZOzuuB5y5Zw8qKbG5DzkHx4U9SSgfnqcpP
 2Wow==
X-Gm-Message-State: ACrzQf08y6Zcbnd+E2/OibD7hSFchpy012DiaTKnUMPJWTrz6EBw/eVP
 3GyZc/3qIfvDc5TghxsVoqyN/hYTDZwSXHXqr7JEBClDHgn9rUsPcjHORoT4iQDQGzqeWuAo79y
 i2rv9foc6uKZv6aU=
X-Received: by 2002:a05:6000:54e:b0:236:5818:d432 with SMTP id
 b14-20020a056000054e00b002365818d432mr20798579wrf.37.1666873157751; 
 Thu, 27 Oct 2022 05:19:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM647rmcwgrcv5HfXu9mYmfG9xJy8Rj+ih9khEg/finZQL92TmVBzIIhovL8HYLze4+xiDCFXA==
X-Received: by 2002:a05:6000:54e:b0:236:5818:d432 with SMTP id
 b14-20020a056000054e00b002365818d432mr20798565wrf.37.1666873157511; 
 Thu, 27 Oct 2022 05:19:17 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-195.web.vodafone.de.
 [109.43.176.195]) by smtp.gmail.com with ESMTPSA id
 p9-20020a5d68c9000000b0022cc6b8df5esm1099284wrw.7.2022.10.27.05.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 05:19:17 -0700 (PDT)
Message-ID: <e52e6240-00c0-c6ee-7cb6-fbd7073f5315@redhat.com>
Date: Thu, 27 Oct 2022 14:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/vm: use -o IdentitiesOnly=yes for ssh
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20221027113026.2280863-1-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221027113026.2280863-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/10/2022 13.30, Ilya Leoshkevich wrote:
> When one has a lot of keys in ~/.ssh directory, the ssh command will
> try all of them before the one specified on the command line, and this
> may cause the remote ssh server to reject the connection due to too
> many failed authentication attempts.
> 
> Fix by adding -o IdentitiesOnly=yes, which makes the ssh client
> consider only the keys specified on the command line.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   tests/vm/basevm.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index 4fd9af10b7f..2276364c42f 100644
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -233,7 +233,8 @@ def _ssh_do(self, user, cmd, check):
>                      "-o", "UserKnownHostsFile=" + os.devnull,
>                      "-o",
>                      "ConnectTimeout={}".format(self._config["ssh_timeout"]),
> -                   "-p", str(self.ssh_port), "-i", self._ssh_tmp_key_file]
> +                   "-p", str(self.ssh_port), "-i", self._ssh_tmp_key_file,
> +                   "-o", "IdentitiesOnly=yes"]
>           # If not in debug mode, set ssh to quiet mode to
>           # avoid printing the results of commands.
>           if not self.debug:

Ah, great, I've run into this problem in the past already, too, but I didn't 
find that config switch! Good to know that there is a solution!

Reviewed-by: Thomas Huth <thuth@redhat.com>


