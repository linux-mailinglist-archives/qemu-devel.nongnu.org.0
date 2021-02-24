Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8817323807
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 08:46:45 +0100 (CET)
Received: from localhost ([::1]:55860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEose-0007oM-Me
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 02:46:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEoqv-0007EI-8G
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 02:44:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEoqt-00039a-IN
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 02:44:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614152693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCZ4ZZxJ3Xu4RjPdCzs6nqk6n0rXUlbLmwzpGsOYK70=;
 b=Vqlzawq4AuHu5w9EpZKO7YMuQmfyu4GggmXrjudBPNBgki9Uc5GdNVUxXLubbH76aw+d3S
 Ntf+gWZRc54FK6jjuY0GlhUVk1CNqaUYAeZjrBQ+EaNL964CjQvT+2edbCtZLmai491lQk
 +l/+yIoOua+q1uXYy8t6HQvk2Grlv54=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-3gS4PkLVMEijo9B0EkY2Pw-1; Wed, 24 Feb 2021 02:44:51 -0500
X-MC-Unique: 3gS4PkLVMEijo9B0EkY2Pw-1
Received: by mail-ej1-f69.google.com with SMTP id g7so474856ejd.16
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 23:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PCZ4ZZxJ3Xu4RjPdCzs6nqk6n0rXUlbLmwzpGsOYK70=;
 b=fRD4cEpte9EKY+vy8fHJ1qL1SEIHbAAO3FolZ6V+ijY4QGOO3Qsp1SsTi1owdhBAFg
 pNGQc66DmrTCEsB7nwAibPk3mJ01wJ2HfUgPZqzJJBbvbbUgCkUl/QalfYGnEf/MTUTv
 VNFu7y9vP8ab7QUtgmSo0HAyHPUysBzj8G6aN5SGbm2rXgIiijFkZ6NYn+l6dUEat76U
 KerPVQW+tDVGsQmTioZ7+xCDELP1rRbGRery4UTcw5yQ9YDTnSJQQaRuVZ9zwkd4/EGt
 caC9EwLcKoreYQ6ZhMrO+iZ7hzwlIa0OoLMwkRM9DY1bkgktbX+ozRqEVTlw2NsfBHcX
 Btzg==
X-Gm-Message-State: AOAM532SPwlhrtwvVj39n085C1NM3Jmd7vGLk/jx6YHsdXAPtKGFBlMI
 Z1Lx6C72TrUL1lwnssaEbTQTrINXjmcIKrITlmvhTax0wnPnGpEyetaIfydoGKlR3EpHPpT4Xi8
 wALNdbaBKCF+bIoM=
X-Received: by 2002:a17:906:3acc:: with SMTP id
 z12mr31086265ejd.494.1614152690174; 
 Tue, 23 Feb 2021 23:44:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX7nX6kBNnWWdWUaLPewHdZUsjFyoXNJpTVAgDPIVvxTHSD+cwhF+PSmzaHXpFmKlH+6kXdg==
X-Received: by 2002:a17:906:3acc:: with SMTP id
 z12mr31086249ejd.494.1614152690027; 
 Tue, 23 Feb 2021 23:44:50 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d5sm850701edu.12.2021.02.23.23.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 23:44:49 -0800 (PST)
Subject: Re: [PATCH 1/2] gitlab-ci.yml: Allow custom make parallelism
To: Daniele Buono <dbuono@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20210222230106.7030-1-dbuono@linux.vnet.ibm.com>
 <20210222230106.7030-2-dbuono@linux.vnet.ibm.com>
 <20057039-92b4-5b0f-436d-7310e9e59dfe@redhat.com>
 <2209b899-4de1-5b8d-99de-0b993575c0a3@linux.vnet.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0bed82c8-f40d-8a22-74e5-7eede5ef80c5@redhat.com>
Date: Wed, 24 Feb 2021 08:44:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <2209b899-4de1-5b8d-99de-0b993575c0a3@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/21 20:34, Daniele Buono wrote:
> This works, but setting this value to 1 for everybody seems a bit too
> restrictive. While the gitlab ci runners don't have enough memory for
> this, that's not necessarily true for every build platform, and linking
> multiple targets in parallel with LTO can result in a big save in time,
> so I'd prefer a customizable way.
> 
> How about adding a flag `--max-ld-procs` to configure to manually set
> backend_max_links?

Another possibility is to invoke "meson configure build 
-Dbackend_max_links=1" after configure.

Paolo

> This would also allow setting it up to any specific number above 1,
> which looking at the Makefile seems to not be possible now: because of
> how the -j flag is passed from make to ninja, a compilation is either
> sequential or parallel based on #cpus


