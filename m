Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8B52D9E3F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:55:36 +0100 (CET)
Received: from localhost ([::1]:39744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kos4N-0003lj-KU
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:55:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kos1X-0001MM-Qn
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:52:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kos1V-0006fg-1f
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607968356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4NpX/O7gVX9es2aYfhbVmDRCjD+h8p7wJ0xL7ydk2+0=;
 b=L2smLK0LnsfIJuK8sZGzc5RcaOIYkLeNMklUi70VYoMVbiZhCuX04y5GmG/APdCFGc+9TA
 4A6zcR6nt9I7iqohC0Tau+G1pMDhoq3GYT8i4eqAtpEawyXTNX9VmG5mhHOCru22gv1jzi
 vJio0aGgEoqlHoJkNm9vVLxzjM5GhMY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-syuNTjNmMImQ1bC4yYTOEQ-1; Mon, 14 Dec 2020 12:52:34 -0500
X-MC-Unique: syuNTjNmMImQ1bC4yYTOEQ-1
Received: by mail-wr1-f69.google.com with SMTP id i4so6941383wrm.21
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 09:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4NpX/O7gVX9es2aYfhbVmDRCjD+h8p7wJ0xL7ydk2+0=;
 b=h0cncT3n/BAnp0wx/ovyB3cWIy75SuRzE+MTrUwTJDxLH2JINUDXG+x6BfnlUHAlzs
 gx3BOKtiVi5UVWWaKLdcMIkCd4AAyX/hvkNETiHuPmDYZoVZlIm3VEQQyxyaD4OlyI6B
 CHS0EqT+odcRwOxu+HXX+nHhA42oGuJtj1Mvw7pnG8afL/7NPljrEKlzPkaVYYrf2oUG
 nR4KjNP6tbE2rz2C2wqEnwGVrFBcYB/X3peIIcV+G0wnqXTrZvqh9uXfCd48pVsEnp+X
 ebavtMMguE5VdlTwHLKbOcc83XpPzXYRKyZW/KrLU3lHEKoNT0haNqz9lniSbTfoq7KL
 frng==
X-Gm-Message-State: AOAM533G+jtlqKlwz0Z50Sa1l+1JS3wFcMnrS01N6+W1mXEbGYdedazh
 lnq04IE4aXIApchlfjLKCi3xNZsCmsQenKor7yK4MCb5JVx8fLxATl+VfNfn7GXBKZgOi7xTkoS
 Yen1xQ1mv7GZWfcA=
X-Received: by 2002:a1c:630b:: with SMTP id x11mr28927032wmb.138.1607968353135; 
 Mon, 14 Dec 2020 09:52:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFzFHvoQBV1LvdQEQC6d6dZQXm0fowt972jUN8DCdH72m9EGFOufO4irnmq1XaSYc2kDmjng==
X-Received: by 2002:a1c:630b:: with SMTP id x11mr28927009wmb.138.1607968352875; 
 Mon, 14 Dec 2020 09:52:32 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id i9sm36509303wrs.70.2020.12.14.09.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 09:52:32 -0800 (PST)
Subject: Re: [RFC PATCH 1/2] gitlab-ci: Step in to maintain the
 fedora-i386-cross runner
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
References: <20201211171703.537546-1-philmd@redhat.com>
 <20201211171703.537546-2-philmd@redhat.com>
 <fe1213a5-a706-adaf-25a7-8323f42239da@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bc8b270a-ef99-8eeb-d1fd-61ab7507b78d@redhat.com>
Date: Mon, 14 Dec 2020 18:52:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <fe1213a5-a706-adaf-25a7-8323f42239da@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 1:35 PM, Thomas Huth wrote:
> On 11/12/2020 18.17, Philippe Mathieu-Daudé wrote:
>> As I am interested in using the runner based on the fedora-i386-cross
>> docker image, add a smoke test job to be sure this image is usable,
>> and set the JOB_MAINTAINER_NAME/JOB_MAINTAINER_EMAIL variables so
>> other developers can contact me in case there is a problem with the
>> public runner based on this image.
>>
>> We will eventually send a patch to make script/checkpatch.pl parse
>> the Gitlab YAML jobs to understand the JOB_MAINTAINER_NAME and
>> JOB_MAINTAINER_EMAIL variables.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds.yml | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index bd6473a75a7..864cad7cec5 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -39,6 +39,13 @@
>>        ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-system
>>      - make -j$(expr $(nproc) + 1) all check-build
>>  
>> +.cross_sanity_check_job:
>> +  stage: build
>> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>> +  timeout: 3m
>> +  script:
>> +    - /bin/true
> 
> I guess it makes more sense if I respin my patch here instead:
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg762919.html
> 
> ?

I think these are different. The idea of testing /bin/true is to be
able to make the distinction between a broken runner and a broken
test.

> 
>  Thomas
> 


