Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB29F36DD6C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:47:36 +0200 (CEST)
Received: from localhost ([::1]:33616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnLb-0003Cu-Ne
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbnDZ-0006GJ-Dm
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbnDX-0002of-Ks
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619627955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NA69Tfjenpa3qNCZdSn29Xol1B12PCiFl1A9Zbz85l8=;
 b=QrK3suS0POh7xEzi/8ONC3GZFjZCmMObxKQ51tz8RQzJmvR4sUKUJP0VsnB58zQJrMzxry
 rktFisRiRj9ivclcLQVCQfhgK2cnGhAnsUEdgbDtX/dZeWlB2D8wrXGnukpydBar9eSvEJ
 O1bD97k5KFYvjkSi4S97xFdMrcxmeB8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-UaXIQBhNPWyxwJwPYivCXQ-1; Wed, 28 Apr 2021 12:39:13 -0400
X-MC-Unique: UaXIQBhNPWyxwJwPYivCXQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 32-20020adf92a30000b029010d6849a4e1so2441281wrn.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 09:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NA69Tfjenpa3qNCZdSn29Xol1B12PCiFl1A9Zbz85l8=;
 b=g1uiNIRcfvnE+Wl8P5E6DigrmCWPVj0BVxqo/YmWs0XQdlgZ5jM2kZ05RBbtt+tjE2
 6FmdAcrvzr3CeW44wQ/ODuqbhTaFvIjD4BVu9YxI2Z5PAwBJzbqEa79RXwIbN5e7LVP/
 0oeCr8YsUa0R5dC5PNXAj3+72N1cpBe6eUCD6J9i9OYt2xy8MSg8oOeb4I+FbhRT/u25
 3D2PrjjeiMe7uKSQm6m5Z2hiTRBgISlWnzmGj9/YcYOBtsdUfWO+EbBCnUkIbioQzuIh
 N6a6OiGX0Y58LVWu5a+mbaEEQK0aLHzra0ossmfzHbwbpYLujdavzXj+3H/Lg2au21Ws
 Cb7Q==
X-Gm-Message-State: AOAM531GJX9Z38uznjVocbY0jrCXUc2wNGcbV3YTCirxO6mfJR8hvzCY
 xKw9IYezbur/assJvHOO88tQARnvonOKJxt4By2OYuerWjQ1xpFUP7lMwUnlIEIKvXZclQlAXqu
 QqK8xocYO7jYf+PI=
X-Received: by 2002:adf:e9c2:: with SMTP id l2mr1788914wrn.323.1619627951998; 
 Wed, 28 Apr 2021 09:39:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypq3KuieiSpg74AGtoJsqJmbI16q6vUzSh2gHuF81q3BnG3Sp7scLbVhA5aYT6nDSeQf2XcQ==
X-Received: by 2002:adf:e9c2:: with SMTP id l2mr1788888wrn.323.1619627951823; 
 Wed, 28 Apr 2021 09:39:11 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j7sm233102wmi.21.2021.04.28.09.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:39:11 -0700 (PDT)
Subject: Re: [PATCH v4 10/12] qtest/qmp-cmd-test: Make test build-independent
 from accelerator
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-11-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f61bfda3-420c-5b3b-c507-6f034caad34a@redhat.com>
Date: Wed, 28 Apr 2021 18:39:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415163304.4120052-11-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas, Markus, do you mind reviewing this one please?

On 4/15/21 6:33 PM, Philippe Mathieu-Daudé wrote:
> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by a runtime check.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/qmp-cmd-test.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index c98b78d0339..8902d2f169f 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -21,19 +21,24 @@ const char common_args[] = "-nodefaults -machine none";
>  
>  /* Query smoke tests */
>  
> +static bool tcg_accel_available;
> +
>  static int query_error_class(const char *cmd)
>  {
> -    static struct {
> +    static const struct {
>          const char *cmd;
>          int err_class;
> +        /*
> +         * Pointer to boolean.
> +         * If non-NULL and value is %true, the error class is skipped.
> +         */
> +        bool *skip_err_class;
>      } fails[] = {
>          /* Success depends on build configuration: */
>  #ifndef CONFIG_SPICE
>          { "query-spice", ERROR_CLASS_COMMAND_NOT_FOUND },
>  #endif
> -#ifndef CONFIG_TCG
> -        { "query-replay", ERROR_CLASS_COMMAND_NOT_FOUND },
> -#endif
> +        { "query-replay", ERROR_CLASS_COMMAND_NOT_FOUND, &tcg_accel_available },
>  #ifndef CONFIG_VNC
>          { "query-vnc", ERROR_CLASS_GENERIC_ERROR },
>          { "query-vnc-servers", ERROR_CLASS_GENERIC_ERROR },
> @@ -51,6 +56,9 @@ static int query_error_class(const char *cmd)
>      int i;
>  
>      for (i = 0; fails[i].cmd; i++) {
> +        if (fails[i].skip_err_class && *fails[i].skip_err_class) {
> +            continue;
> +        }
>          if (!strcmp(cmd, fails[i].cmd)) {
>              return fails[i].err_class;
>          }
> @@ -334,6 +342,8 @@ int main(int argc, char *argv[])
>      QmpSchema schema;
>      int ret;
>  
> +    tcg_accel_available = qtest_has_accel("tcg");
> +
>      g_test_init(&argc, &argv, NULL);
>  
>      qmp_schema_init(&schema);
> 


