Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1C239F71F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:53:43 +0200 (CEST)
Received: from localhost ([::1]:56332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbEk-0001vp-J1
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqbDH-00010z-Ci
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqbDE-0003UT-UB
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623156727;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7E4MH+xShyY5P3qvZHkyEEiRTP5Mgl/dYmUjJ7xvntU=;
 b=f+H/6iR3saQ33SdP1jpOiJWx0RgPArYH6Bu9BsW/3iCrjZnK6ijkAmXN2pjY8mv0Gbcnus
 oxN2JPfE6BDvukEWKYIRYx970BOPfCzs5ADsaYv3t9DualB0G5ijyH9nFgLcgtI6xSXn6q
 WNhRkxL0mgEg/tLbBnqz+pa4EL+YOWs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-ol2gfpcfPkSZM6UOKwDbeA-1; Tue, 08 Jun 2021 08:52:06 -0400
X-MC-Unique: ol2gfpcfPkSZM6UOKwDbeA-1
Received: by mail-qv1-f71.google.com with SMTP id
 n17-20020ad444b10000b02902157677ec50so15431862qvt.12
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 05:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=7E4MH+xShyY5P3qvZHkyEEiRTP5Mgl/dYmUjJ7xvntU=;
 b=Q93iPrJn4IOD1MFQ2WwAHjB1zUJQ3noT6SBWXpDj7Pma/7XSZvmrjkYAe4W5haor2F
 hA8fVOo/KATMdLKB6WHmSAqNgl332Nm9+q3tHRB3UDvaAxKk18nWwfBJHYKTeBF/6lUY
 fo2J8G9YjacjpFwCRaNWaegnaf4iuz0Qba9/A3r5u6W+fQg7DRm93MZ5XRXIKzRMBUTo
 HPo8yO4WD/38WlUHZrqLxjOU8b9L9Df8TvKJBodPSqVE5M2f8bnA+CnRKAcy2l9xsdk5
 4QmFiAFi/xGp62O+BrIjRN1O5MxXKgTJfxFrzxurOTrReQlaqZBFfcqwF/zoZvLi/pcg
 fwtg==
X-Gm-Message-State: AOAM533dzgclbVNJVzWqKCrzYDbrDh2KSOs0jJccZAAySWyxUP7PQjCi
 JXb74Z+XZ6Mnh0rxpmTq973jWvMc2OR5cgRGcO2SUF3+pSITem2L/wwkL1nrn3eXS9NaisubHZa
 vMk6h09tVrOANkSk=
X-Received: by 2002:ad4:4dcb:: with SMTP id cw11mr22690453qvb.54.1623156725812; 
 Tue, 08 Jun 2021 05:52:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW6YeWY0CxhxfeI7LlSeO5oubM+0cOa50VD0PwqZchXZnw1Apo+G4/3VSF1tT+COBKwgGtEw==
X-Received: by 2002:ad4:4dcb:: with SMTP id cw11mr22690430qvb.54.1623156725569; 
 Tue, 08 Jun 2021 05:52:05 -0700 (PDT)
Received: from wainer-laptop.localdomain ([201.90.138.4])
 by smtp.gmail.com with ESMTPSA id a134sm10043985qkg.114.2021.06.08.05.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 05:52:05 -0700 (PDT)
Subject: Re: [RFC PATCH] scripts/checkpatch: roll diff tweaking into
 checkpatch itself
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210607171829.25111-1-alex.bennee@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <9f79bb3d-2f0d-9a5c-00d8-bcca06cb02c6@redhat.com>
Date: Tue, 8 Jun 2021 09:52:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607171829.25111-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Reply-To: wainersm@redhat.com
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/7/21 2:18 PM, Alex Bennée wrote:
> Rather than relying on external tweaks lets just do it inside
> checkpatch's direct commitish handling which is QEMU specific code
> anyway.
>
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/static_checks.yml | 3 ---
>   .patchew.yml                   | 3 ---
ah, there is the patchew configuration file.
>   scripts/checkpatch.pl          | 7 ++++++-
>   3 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
> index 7e685c6a65..c5fa4fce26 100644
> --- a/.gitlab-ci.d/static_checks.yml
> +++ b/.gitlab-ci.d/static_checks.yml
> @@ -4,9 +4,6 @@ check-patch:
>     needs:
>       job: amd64-centos8-container
>     script:
> -    - git config --local diff.renamelimit 0
> -    - git config --local diff.renames True
> -    - git config --local diff.algorithm histogram
>       - .gitlab-ci.d/check-patch.py
>     variables:
>       GIT_DEPTH: 1000
> diff --git a/.patchew.yml b/.patchew.yml
> index 2638b7f564..1b78262ce5 100644
> --- a/.patchew.yml
> +++ b/.patchew.yml
> @@ -138,9 +138,6 @@ testing:
>         script: |
>           #!/bin/bash
>           git rev-parse base > /dev/null || exit 0
> -        git config --local diff.renamelimit 0
> -        git config --local diff.renames True
> -        git config --local diff.algorithm histogram
>           ./scripts/checkpatch.pl --mailback base..
>       docker-mingw@fedora:
>         enabled: true
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index bbcd25ae05..cb8eff233e 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -399,7 +399,12 @@ if ($chk_branch) {
>   	my $num_patches = @patches;
>   	for my $hash (@patches) {
>   		my $FILE;
> -		open($FILE, '-|', "git", "show", "--patch-with-stat", $hash) ||
> +		open($FILE, '-|', "git",
> +                     "-c", "diff.renamelimit=0",
> +                     "-c", "diff.renames=True",
> +                     "-c", "diff.algorithm=histogram",
> +                     "show",
> +                     "--patch-with-stat", $hash) ||
>   			die "$P: git show $hash - $!\n";
>   		while (<$FILE>) {
>   			chomp;


