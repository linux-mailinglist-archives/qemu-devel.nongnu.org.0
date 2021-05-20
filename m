Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE0638B908
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 23:38:14 +0200 (CEST)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljqMv-0000VT-5a
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 17:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljqLY-0008Fs-PB
 for qemu-devel@nongnu.org; Thu, 20 May 2021 17:36:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljqLW-0005li-Sd
 for qemu-devel@nongnu.org; Thu, 20 May 2021 17:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621546605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mVyD4QZDlOAmz37OADlOimpf7FBpkt75iA86rAHPTP0=;
 b=QAucGPemj0W+DmtDjjH5t1iKjMGiusfGSGx6AlLvpM817mvP0HTlzkkXBxlxr8HFv34rLt
 59TM7qbCYGf0sane/6N6tksw8Pt/p3KLxZTJa53FZ7gUF6ECugepJuN/NN6aKS1MnxZWnF
 FDI4kJJagSHi5m2Mb0t3eIfxc6VuATw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-Hp6WQ8m5P2ar47bYPGUp8Q-1; Thu, 20 May 2021 17:36:43 -0400
X-MC-Unique: Hp6WQ8m5P2ar47bYPGUp8Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 nd10-20020a170907628ab02903a324b229bfso5583355ejc.7
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 14:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mVyD4QZDlOAmz37OADlOimpf7FBpkt75iA86rAHPTP0=;
 b=cMz3Y31uubu9XhzWXtGewZopzzTOfF6oMirfRx1jRTordv6jjvhSBsqKXpIkN3/l4p
 pqLPeXSQnIQIvAh72O7JGA/Be7hzLQVMV/C+W/8NN32mbRJeYhooVDq8Iu9IKfhiOExT
 as4XrvdBfHMsih/1upeePpbQ41sTnKYz3TviipbRkz7cuCKAI+TA/lG1UUXj8r7zhLRv
 Y2790uhi8QZ46x08F9K/+B3gG7Orm7bs+ONZV+Vv2cncc2xSU7baVvUw9qbog+k/qbkO
 BI7h9l91b8g7b5gxfOi0DjtAHLih5iXgB1hVkPm8F/VmqcTbha4mvZdEMjeP0ZBJrzFK
 +rzg==
X-Gm-Message-State: AOAM531q9XIigD7R43QMZK6oFuBt9wDX2iubSYFHrrc7zGLEMqIRVqon
 PWzRf4OreRDqgphxy6G0mSUYdjt7MhAmKcK91aUllbBPkTZMjUh+aCtXgPH08UzW2TWwt/Aewrd
 kh1fwprArANf9uD4=
X-Received: by 2002:a50:ff08:: with SMTP id a8mr6926518edu.46.1621546602755;
 Thu, 20 May 2021 14:36:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOCarH9Af4+AsftZ+NxTTlO4bL9Ihah7umYkTCIjh+ZTdmoSOj1Qege6PZfqBHjzMsYxqFhw==
X-Received: by 2002:a50:ff08:: with SMTP id a8mr6926508edu.46.1621546602575;
 Thu, 20 May 2021 14:36:42 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id i24sm2360028edq.41.2021.05.20.14.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 14:36:42 -0700 (PDT)
Subject: Re: [PULL 02/19] sev: update sev-inject-launch-secret to make gpa
 optional
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210215131626.65640-1-pbonzini@redhat.com>
 <20210215131626.65640-3-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <66d0ca68-2f9f-1ae5-16ee-9dac4873dcbe@redhat.com>
Date: Thu, 20 May 2021 23:36:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210215131626.65640-3-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 2:16 PM, Paolo Bonzini wrote:
> From: James Bottomley <jejb@linux.ibm.com>
> 
> If the gpa isn't specified, it's value is extracted from the OVMF
> properties table located below the reset vector (and if this doesn't
> exist, an error is returned).  OVMF has defined the GUID for the SEV
> secret area as 4c2eb361-7d9b-4cc3-8081-127c90d3d294 and the format of
> the <data> is: <base>|<size> where both are uint32_t.  We extract
> <base> and use it as the gpa for the injection.
> 
> Note: it is expected that the injected secret will also be GUID
> described but since qemu can't interpret it, the format is left
> undefined here.
> 
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Message-Id: <20210204193939.16617-3-jejb@linux.ibm.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qapi/misc-target.json |  2 +-
>  target/i386/monitor.c | 23 ++++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 06ef8757f0..0c7491cd82 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -216,7 +216,7 @@
>  #
>  ##
>  { 'command': 'sev-inject-launch-secret',
> -  'data': { 'packet-header': 'str', 'secret': 'str', 'gpa': 'uint64' },
> +  'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
>    'if': 'defined(TARGET_I386)' }
>  
>  ##
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 1bc91442b1..5994408bee 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -34,6 +34,7 @@
>  #include "sev_i386.h"
>  #include "qapi/qapi-commands-misc-target.h"
>  #include "qapi/qapi-commands-misc.h"
> +#include "hw/i386/pc.h"
>  
>  /* Perform linear address sign extension */
>  static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
> @@ -730,9 +731,29 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
>      return sev_get_capabilities(errp);
>  }
>  
> +#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
> +struct sev_secret_area {
> +    uint32_t base;
> +    uint32_t size;
> +};
> +
>  void qmp_sev_inject_launch_secret(const char *packet_hdr,
> -                                  const char *secret, uint64_t gpa,
> +                                  const char *secret,
> +                                  bool has_gpa, uint64_t gpa,
>                                    Error **errp)
>  {
> +    if (!has_gpa) {
> +        uint8_t *data;
> +        struct sev_secret_area *area;
> +
> +        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {

FYI trying to build MicroVM standalone (--without-default-devices):

/usr/bin/ld: libqemu-i386-softmmu.fa.p/target_i386_monitor.c.o: in
function `qmp_sev_inject_launch_secret':
target/i386/monitor.c:749: undefined reference to
`pc_system_ovmf_table_find'

I'm adding this to my TODO list.


