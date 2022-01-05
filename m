Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA66A485361
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 14:20:04 +0100 (CET)
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56Cx-0003rF-Iu
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 08:20:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n55mi-0004lk-UE; Wed, 05 Jan 2022 07:52:57 -0500
Received: from [2607:f8b0:4864:20::82b] (port=35744
 helo=mail-qt1-x82b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n55mh-0003PA-BN; Wed, 05 Jan 2022 07:52:56 -0500
Received: by mail-qt1-x82b.google.com with SMTP id j17so37417597qtx.2;
 Wed, 05 Jan 2022 04:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OZFySF9LRw3WPL1l8YXZptKl/EvynCXqU6JsWOlLWas=;
 b=p/LSbMbiOlnlF8DaI3svnEIk+ieZ/53ih9UPFaibTzwe5FfIQkOYm5J+OSzHzBqVV1
 A6AX/BN6j34oKBLfupsQzuN3LvVnBDLdnT+HsJrri6OP45xnOSvstN6YY3oc3du2Ae9s
 oVI8qY7YTp9cIfYAcAxCWNw6OHEy034zCrz08HkqRXlqkVf0ufbxm7DM0TG24MrZAy1t
 m4AKjcm2yzcYxrIGA1PS1mwvhabqs9LKWzUmBdkYxjsUSdSTkEZpaoPKZvz5lj9CkfQo
 zEIWyJkqD/Vaqmim/QS0iKEOkYEmsiX4i6KN2iR87UcHf66VJ+tzrsapAY0NngoNZbZZ
 J/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OZFySF9LRw3WPL1l8YXZptKl/EvynCXqU6JsWOlLWas=;
 b=tqz0i0zyVP7iFPZY2fViOCHEEKDN6n78l65+NibyshOIXmVT55XRceDwHmY2kc+G9R
 uWNkxM8ZzwhmUc/EBmnmSXGDyVUYGn+dXr7Rdtug7NjmPPhIdsStzzg/zG561exd3yLh
 bsX/3e1HhGQ+Fea/ZLXYvf+mOFoGzX6VMRzuiNZAjV2Vz26GReZodQVXz9gYOz1bkGLN
 KVuh1Ry+Qm/FRHW3ix+oUj1/YcY9PXqtvJQqdrCY9eo20JyFqXA8wjTXVyWQBnmqOI8w
 +SQcI92fy1D7ud3dcyQdF3iNWlJnI/aH/qYdqrv8UhMTprkCPt5xV3LqclId06xPoFZi
 cm8A==
X-Gm-Message-State: AOAM531Nlb9mVZ7xK+o5SjgzN42QH/3dleOQRXBfgZo9XBMTLJHJ72PN
 ZEhjHEjr5lOn9oct9Cl/wJk=
X-Google-Smtp-Source: ABdhPJxnJXPAiNRueZpEljvonglTpBbuVxmADZ7KDeizdowmZeW7mc1Z5HPt0DX+ZYxuCK295oRubQ==
X-Received: by 2002:a05:622a:1351:: with SMTP id
 w17mr47139361qtk.276.1641387174052; 
 Wed, 05 Jan 2022 04:52:54 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id q15sm31784438qkj.108.2022.01.05.04.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 04:52:53 -0800 (PST)
Message-ID: <632f1e2b-a627-7320-21e5-29ada19f184c@gmail.com>
Date: Wed, 5 Jan 2022 09:52:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] docs/system/ppc: Merge the PEF information into the
 pseries page
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220105103232.405204-1-thuth@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220105103232.405204-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/5/22 07:32, Thomas Huth wrote:
> The Protected Execution Facility is only available with the pseries
> machine, so let's merge the old ASCII text into the new RST file now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Well observed. Thanks for fixing it.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   docs/papr-pef.txt           | 30 ------------------------------
>   docs/system/ppc/pseries.rst | 33 +++++++++++++++++++++++++++++++++
>   2 files changed, 33 insertions(+), 30 deletions(-)
>   delete mode 100644 docs/papr-pef.txt
> 
> diff --git a/docs/papr-pef.txt b/docs/papr-pef.txt
> deleted file mode 100644
> index 72550e9bf8..0000000000
> --- a/docs/papr-pef.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -POWER (PAPR) Protected Execution Facility (PEF)
> -===============================================
> -
> -Protected Execution Facility (PEF), also known as Secure Guest support
> -is a feature found on IBM POWER9 and POWER10 processors.
> -
> -If a suitable firmware including an Ultravisor is installed, it adds
> -an extra memory protection mode to the CPU.  The ultravisor manages a
> -pool of secure memory which cannot be accessed by the hypervisor.
> -
> -When this feature is enabled in QEMU, a guest can use ultracalls to
> -enter "secure mode".  This transfers most of its memory to secure
> -memory, where it cannot be eavesdropped by a compromised hypervisor.
> -
> -Launching
> ----------
> -
> -To launch a guest which will be permitted to enter PEF secure mode:
> -
> -# ${QEMU} \
> -    -object pef-guest,id=pef0 \
> -    -machine confidential-guest-support=pef0 \
> -    ...
> -
> -Live Migration
> -----------------
> -
> -Live migration is not yet implemented for PEF guests.  For
> -consistency, we currently prevent migration if the PEF feature is
> -enabled, whether or not the guest has actually entered secure mode.
> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
> index 72e315eff6..16394fa521 100644
> --- a/docs/system/ppc/pseries.rst
> +++ b/docs/system/ppc/pseries.rst
> @@ -230,6 +230,39 @@ nested. Combinations not shown in the table are not available.
>   
>   .. [3] Introduced on Power10 machines.
>   
> +
> +POWER (PAPR) Protected Execution Facility (PEF)
> +-----------------------------------------------
> +
> +Protected Execution Facility (PEF), also known as Secure Guest support
> +is a feature found on IBM POWER9 and POWER10 processors.
> +
> +If a suitable firmware including an Ultravisor is installed, it adds
> +an extra memory protection mode to the CPU.  The ultravisor manages a
> +pool of secure memory which cannot be accessed by the hypervisor.
> +
> +When this feature is enabled in QEMU, a guest can use ultracalls to
> +enter "secure mode".  This transfers most of its memory to secure
> +memory, where it cannot be eavesdropped by a compromised hypervisor.
> +
> +Launching
> +^^^^^^^^^
> +
> +To launch a guest which will be permitted to enter PEF secure mode::
> +
> +  $ qemu-system-ppc64 \
> +      -object pef-guest,id=pef0 \
> +      -machine confidential-guest-support=pef0 \
> +      ...
> +
> +Live Migration
> +^^^^^^^^^^^^^^
> +
> +Live migration is not yet implemented for PEF guests.  For
> +consistency, QEMU currently prevents migration if the PEF feature is
> +enabled, whether or not the guest has actually entered secure mode.
> +
> +
>   Maintainer contact information
>   ------------------------------
>   

