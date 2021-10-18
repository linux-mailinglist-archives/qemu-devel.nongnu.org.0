Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C114D431095
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 08:31:34 +0200 (CEST)
Received: from localhost ([::1]:44914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcMBJ-0003ou-SE
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 02:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mcM8i-000372-JI
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 02:28:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mcM8g-0005Ik-UZ
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 02:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634538529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GDJ+Z100YJZyzls0hmuCmmVvf9RWrgQ7GIrNT/0h1O8=;
 b=Dj5cfskwORiV+CH8Q/PbtQceI2cMQlgkEpZx9tYz8gw2yAH6B/Wlf4ptS08Jaw7WXrDmot
 0T3GOtIYrzfOGRLj45OzGfVkUCVcHLuZBd4BB9dkfsl3Avfm9fimKrDFglLmVZRRZjh55T
 8gsTUlBC9CNfJfjg29cpEP5Mm7NmUIo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206--55ylTW6Pu24vkjG153FkA-1; Mon, 18 Oct 2021 02:28:42 -0400
X-MC-Unique: -55ylTW6Pu24vkjG153FkA-1
Received: by mail-wm1-f70.google.com with SMTP id
 y142-20020a1c7d94000000b00322f2e380f2so1528998wmc.6
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 23:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GDJ+Z100YJZyzls0hmuCmmVvf9RWrgQ7GIrNT/0h1O8=;
 b=V+H+PaIOjOKHf5bt4eSX1W8NJucSsxSsIH8oY8tp+Um2XbUxGrmNL/5xRopfZqfsTk
 H9hp+u/G5v4CHFIeEEOBxHd6RK8G7TJtraY6d51xgijWdWRZKvWWq3SlOhERVQTxdtfw
 54yv+OLhg1JPNCG6XffEVbZEkObwRZ3qo3DVNK+w3969upcBjGhjBOGlOWfBPpcPt2IS
 ZrVeZGnr7u3zDNxSiIxa+nhjlBWkVcHqJHkvnsFVL4KjuOZJS7dSp8bJpHAhEOHc7pBE
 kHksaWbUl0a85pe2cy0vkv2nvkRCVZrNpEoA42FI3RYYBVhqw2EQ1Zm9tnetEz4QhkyB
 6uRg==
X-Gm-Message-State: AOAM530u0Hp4QVVeGJH71sz/1ff2HPd7149rYY4dPX8eoqykoSvdEsRg
 /SmS2ktbZFYBu4ZHbYk6lth/Ll2tmQ+YoCf04KyxFqwVgvGFOOW8aAd3BY1rAUKujlRWEZ79VkA
 D79xV/Ihmi8gQCDg=
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr33024185wrz.20.1634538521284; 
 Sun, 17 Oct 2021 23:28:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze09PTBSLzf4k6Q+UkHx1q1n0vRivVTo5719mEaxUZtSKo9K3DwELmblBVBNRD/qWmvjkt1A==
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr33024166wrz.20.1634538521108; 
 Sun, 17 Oct 2021 23:28:41 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id t18sm13069923wrm.81.2021.10.17.23.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 23:28:40 -0700 (PDT)
Subject: Re: [PATCH] tests/vm: update openbsd to release 7.0
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YWtYi8A2KaJ8PG9K@humpty.home.comstyle.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b32ccbe3-6db2-fb9b-be9b-6c418868b62f@redhat.com>
Date: Mon, 18 Oct 2021 08:28:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWtYi8A2KaJ8PG9K@humpty.home.comstyle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Alex Benn_e <alex.bennee@linaro.org>, Philippe Mathieu-Daud_ <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/10/2021 00.56, Brad Smith wrote:
> tests/vm: update openbsd to release 7.0
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---
>   tests/vm/openbsd | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
> index c4c78a80f1..abf510e117 100755
> --- a/tests/vm/openbsd
> +++ b/tests/vm/openbsd
> @@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
>       name = "openbsd"
>       arch = "x86_64"
>   
> -    link = "https://cdn.openbsd.org/pub/OpenBSD/6.9/amd64/install69.iso"
> -    csum = "140d26548aec680e34bb5f82295414228e7f61e4f5e7951af066014fda2d6e43"
> +    link = "https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/install70.iso"
> +    csum = "1882f9a23c9800e5dba3dbd2cf0126f552605c915433ef4c5bb672610a4ca3a4"
>       size = "20G"
>       pkgs = [
>           # tools

That does not work for me. It hangs in the "DNS domain ..." line
until it times out. When I disable that line with:

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index abf510e117..dfefb6bba3 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -98,7 +100,7 @@ class OpenBSDVM(basevm.BaseVM):
          self.console_wait_send("IPv4 address",            "dhcp\n")
          self.console_wait_send("IPv6 address",            "none\n")
          self.console_wait_send("Which network interface", "done\n")
-        self.console_wait_send("DNS domain name",         "localnet\n")
+        #self.console_wait_send("DNS domain name",         "localnet\n")
          self.console_wait("Password for root account")
          self.console_send("%s\n" % self._config["root_pass"])
          self.console_wait("Password for root account")

... then it succeeds the installation... could you please check
with a fresh install on your side whether you could reproduce
this problem?

  Thanks,
   Thomas


