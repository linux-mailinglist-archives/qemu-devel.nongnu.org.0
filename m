Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC84DDBDD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:43:57 +0100 (CET)
Received: from localhost ([::1]:47828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDpc-0004ib-Fs
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:43:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nVDoi-0003J7-Dd; Fri, 18 Mar 2022 10:43:00 -0400
Received: from [2607:f8b0:4864:20::1029] (port=50995
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nVDog-0007Pj-Nz; Fri, 18 Mar 2022 10:43:00 -0400
Received: by mail-pj1-x1029.google.com with SMTP id m22so7619085pja.0;
 Fri, 18 Mar 2022 07:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EhOjmmlk6lfmEc3bhbVxGITu9BQG2eWb5VTDIIzKOU8=;
 b=pRuZ/I/xk8QcJPLI4CtcSG44RT2gFwno3EFhLCrzNK8/SR9jplC8+d38ay4igkW1rh
 fOuu7MzD8usg/vEqlVP/TXafdJabSSTSxRtV6DJQ5/R0prLX/dr/aIBdmoailBipfYAT
 7eFDexunPO1z1FqEO15ig7cV2+XYVDlyWk+DsGmaWSrOhEobXHSoN8WRiD1NkSqQvy3v
 yE7cIBVTYivXhBUJeYy8rcX6p2uJEwjGALpBsSagzcqjPsOIPyUsJmS4VKvIOxgIUi0j
 teAOXnRhYaXvaK6xzgj5FkOGcvBFALwxitlcTC7V9c67QbOq7i6rkZyLXKUAfLVlWC/3
 0m/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EhOjmmlk6lfmEc3bhbVxGITu9BQG2eWb5VTDIIzKOU8=;
 b=0gSfKADvd09IWzVVBZDhaXT6g/YF0Zd7KxRl3dm4+P/QLVh11KL0L26bTiTWJmc8Z5
 TWux61vt9PGzU3VL+vmWJ69kdJIamwLkGCVfUc0Jiq8N9LsiyyZ0U1RfmUv/bVwJTJ+d
 /rwaokC7aPbohCZ3oT4MJ3Eygiz2yH/Dt4oLTJww76yGCVo6zdiCUr6tgdMkIkIVuFbo
 MDvVHrgk0I+Dh/P6WWMwlaQ6KIQfQ9L3snhov4LTL3l1h3INv9ZJXNzJAF2IlLWp7GlT
 3Mp6yKnlxhHqlwukB7r0jj8UmsM/iQuF2rtbD7LQyImEczaoxq0uHRprcUDMn7qFUayr
 PQTA==
X-Gm-Message-State: AOAM531DONOfN7D2nCBJJAZztMs2ywy70gH6qRaVLPoezf7jEy+bwcTP
 vV71b9rWXNx77x5r3ddDQ8k=
X-Google-Smtp-Source: ABdhPJw2XFkE5/SRMIGjMUp+WokP6pYRe1TS4GNWUmvf/GZ7iALKtVqVbFKBxl60297OVNuf/C/RSA==
X-Received: by 2002:a17:902:7b88:b0:154:10fd:e748 with SMTP id
 w8-20020a1709027b8800b0015410fde748mr2796703pll.120.1647614576072; 
 Fri, 18 Mar 2022 07:42:56 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a056a00088900b004e03b051040sm10567765pfj.112.2022.03.18.07.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 07:42:55 -0700 (PDT)
Message-ID: <69c6db77-273e-dbeb-e695-e20772d003e2@gmail.com>
Date: Fri, 18 Mar 2022 23:42:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] gitattributes: Cover Objective-C source files
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20220317130326.39188-1-philippe.mathieu.daude@gmail.com>
 <62dbdfcf-771e-7c84-ab8b-b02a61112f86@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <62dbdfcf-771e-7c84-ab8b-b02a61112f86@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I don't think this is needed. I could see a diff annotated with a method 
name even without this change:
% git diff
diff --git a/ui/cocoa.m b/ui/cocoa.m
index cb6e7c41dc6..14a4416cc8b 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1264,6 +1264,7 @@ - (id) init
          [pauseLabel setTextColor: [NSColor blackColor]];
          [pauseLabel sizeToFit];
      }
+    //
      return self;
  }

Commit 29cf16db23 says:
> Since commits 0979ed017f0 ("meson: rename .inc.h files to .h.inc")
> and 139c1837db7 ("meson: rename included C source files to .c.inc")
> 'git-diff --function-context' stopped displaying C function context
> correctly.

So I suspect Git has some knowledge of common file extensions like .c, 
.h and .m although I couldn't find in the source code of Git.

Regards,
Akihiko Odaki

On 2022/03/18 23:10, Philippe Mathieu-Daudé wrote:
> +qemu-trivial@
> 
> On 17/3/22 14:03, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> See comments in commit 29cf16db23 ("buildsys: Help git-diff
>> adding .gitattributes config file") for details.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   .gitattributes | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/.gitattributes b/.gitattributes
>> index 07f430e944..a217cb7bfe 100644
>> --- a/.gitattributes
>> +++ b/.gitattributes
>> @@ -1,3 +1,4 @@
>>   *.c.inc         diff=c
>>   *.h.inc         diff=c
>> +*.m             diff=objc
>>   *.py            diff=python
> 


