Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3662637B522
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 06:48:46 +0200 (CEST)
Received: from localhost ([::1]:32852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lggnd-0002Az-BK
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 00:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lggmq-0001J3-C5
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:47:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lggmo-0000j6-Mp
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620794873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8xZLVP+VMpke7CzvFBvXpdJgVEOQY5SuCSNMvgOvpow=;
 b=ijv4FGgKBfb3VqdZn6SU1SmcneG8hOYVrIYIBtUuWPjwHl4nEjZr5pxhZQY3xKh3z+7C4Z
 h/ixXGVPsXGSEfzcdOkx6d1gTmmwb8trH1fOLGl0jMLB+XiqHtU7onV4qvcyYEn9ZdP3t2
 Y/SZ+XhtuHciu66ECoD2tJ2QMHOEb58=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-_70HYqGZO92aPOYbQSLsZw-1; Wed, 12 May 2021 00:47:49 -0400
X-MC-Unique: _70HYqGZO92aPOYbQSLsZw-1
Received: by mail-wr1-f69.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso9590999wrf.11
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8xZLVP+VMpke7CzvFBvXpdJgVEOQY5SuCSNMvgOvpow=;
 b=bVCXVZRlWTycXW2MCpMZX/RsUjw9OsUt02bLqu4JkvAqKuisc97hL1+yal1wYtWl2h
 wDsvq9ATa+qxTjFYRSAcBIeLnRzxRjL/DPBw8G4guduoCf8kertMn+LVZE3CnMZEdh3d
 wRVEXmVV6iQJWzk9q1TchM9Da/eoJoS4XtaaCf1rIEy6G2pF7J4t03BHTXeM8A/LGGhT
 d0AWXl3+EXLCF4YrqfQlZUqJysZVOAYcrzhLAFzQHtgAKAkj016ibHDY1NF0zwd1AZsO
 8LcGlb3akM5CYxv0cjPZjUtsZNGNI7IYS8fiUvwrH9FwCGFH5Y8lZ+6YgMn1EuZKEgYC
 Q26g==
X-Gm-Message-State: AOAM530/V/22RYvT2Z8JM84VTWMNMO4fmislkvl0f2xaxLA/7xb/21mH
 ScjsfWgH7vnUjMlzu0MtG0sivPrfE4XSZSZHMM3DvU2Et5FQwUi/2LYUQmPItXYEFHy6y0qgje7
 /ORu/zqOQWjUMzhE=
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr2982453wmb.92.1620794868596;
 Tue, 11 May 2021 21:47:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBdlieGM18sBMQSd0oraa5uyqA7LuxLSzjAfYZ4JuIAVa9gDBPZ9jE8NC2HwziVgyvntNP+w==
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr2982410wmb.92.1620794868205;
 Tue, 11 May 2021 21:47:48 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id k11sm29582138wrm.62.2021.05.11.21.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 21:47:47 -0700 (PDT)
Subject: Re: [PATCH v2 01/30] checkpatch: Fix use of uninitialized value
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
 <20210504100223.25427-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <12edcc38-a5e8-121a-44c2-a5bda525db3c@redhat.com>
Date: Wed, 12 May 2021 06:47:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504100223.25427-2-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: fam@euphon.net, Isaku Yamahata <isaku.yamahata@intel.com>,
 berrange@redhat.com, Greg Kurz <groug@kaod.org>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 12:01 PM, Alex Bennée wrote:
> From: Greg Kurz <groug@kaod.org>
> 
> checkfilename() doesn't always set $acpi_testexpected. Fix the following
> warning:
> 
> Use of uninitialized value $acpi_testexpected in string eq at
>  ./scripts/checkpatch.pl line 1529.
> 
> Fixes: d2f1af0e4120 ("checkpatch: don't emit warning on newly created acpi data files")
> Signed-off-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: isaku.yamahata@intel.com
> Message-Id: <20210408164610.14229-1-alex.bennee@linaro.org>
> Message-Id: <161786467973.295167.5612704777283969903.stgit@bahia.lan>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  scripts/checkpatch.pl | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 8f7053ec9b..3d185cceac 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1532,6 +1532,7 @@ sub process {
>  		     ($line =~ /\{\s*([\w\/\.\-]*)\s*\=\>\s*([\w\/\.\-]*)\s*\}/ &&
>  		      (defined($1) || defined($2)))) &&
>                        !(($realfile ne '') &&
> +                        defined($acpi_testexpected) &&
>                          ($realfile eq $acpi_testexpected))) {
>  			$reported_maintainer_file = 1;
>  			WARN("added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


