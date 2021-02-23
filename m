Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0AF3226F0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 09:14:43 +0100 (CET)
Received: from localhost ([::1]:40468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lESqA-000425-H5
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 03:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lESoL-0003S6-8S
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:12:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lESoG-0005lC-De
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614067963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBwqpH9c3Jad62SBPHBkJ4tyKhFs3MVLd1AWbpqvjtA=;
 b=Rra5PBZ21VIbWig8kPskM69Dlnb8CGMd2q+40gJIBSCEOxP4p0uczmo8AGAYzljqTyXCtq
 2csZpvbY4p45S06uXD5I43x2JCO6PqlP/J6CrjqdzcpJpuGxqQzjD0GM4CLRpjl9unVmti
 NdowifB/D4QyJRAyD5upAud43OPxGu0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-j80oDzLWPEift4lxQB9v5A-1; Tue, 23 Feb 2021 03:12:41 -0500
X-MC-Unique: j80oDzLWPEift4lxQB9v5A-1
Received: by mail-ej1-f71.google.com with SMTP id p6so1546933ejw.1
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 00:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NBwqpH9c3Jad62SBPHBkJ4tyKhFs3MVLd1AWbpqvjtA=;
 b=QZMUgFRLqUNJBvpG9hepAm/CKvueIcx+xiJmGUdBXz/3M+8uKY9PIurTtW14CcgMTE
 P5YFqGHNbksEnr6iNlhV3xNV8Dd4FH+3EBiS2Kso4YdPF8r4NsZrC2Cx+/WWks9eQqSu
 XQjMMMUd/r8YHdsftSmhBtCmHd7mtlNeVs2msJvfTlE+ihyzSDA+JvQEK0LncO3wzrAz
 LzKyFS5IFnYXvV0o4Hh23NBE4kNSLpaKqmi8wYLIBmq8t/26BY3pW6ABhLJBWSi22D4y
 wNKADVDx81v0dsD3MN5e7GL3OBn2Fn1eUK3FbTMtb2dNoFf3VcMjJC3ArT1LVESQs9v1
 ulMw==
X-Gm-Message-State: AOAM532sM3QwoLzvlGO3N2I25lKECUa2JK7qnjlAdHRnagJts+zS29to
 SfsnFRRzQ3t/hLFT51AmmoNHq9vGcMy74wxYX0BZFxkZi+oDOnxT1qbgEwp6IXdpCme0ferhH4P
 We8p5lKr5WVPKl5k=
X-Received: by 2002:a17:906:cf84:: with SMTP id
 um4mr24873816ejb.61.1614067959847; 
 Tue, 23 Feb 2021 00:12:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcrZihCqcQLRUqKItLDPx75x1CuSLi4Cfda/rIJo4ZzZCNUgqfg6v07qh5LoiDrWacBjXTXA==
X-Received: by 2002:a17:906:cf84:: with SMTP id
 um4mr24873791ejb.61.1614067959465; 
 Tue, 23 Feb 2021 00:12:39 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rn18sm12044784ejb.99.2021.02.23.00.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 00:12:38 -0800 (PST)
Subject: Re: [PATCH 1/2] gitlab-ci.yml: Allow custom make parallelism
To: Daniele Buono <dbuono@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20210222230106.7030-1-dbuono@linux.vnet.ibm.com>
 <20210222230106.7030-2-dbuono@linux.vnet.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20057039-92b4-5b0f-436d-7310e9e59dfe@redhat.com>
Date: Tue, 23 Feb 2021 09:12:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222230106.7030-2-dbuono@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 23/02/21 00:01, Daniele Buono wrote:
> Currently, make parallelism at build time is defined as #cpus+1. Some 
> build jobs may need (or benefit from) a different number. An example is 
> builds with LTO where, because of the huge demand of memory at link 
> time, gitlab runners fails if two linkers are run concurrently This 
> patch retains the default value of #cpus+1 but allows setting the "JOBS" 
> variable to a different number when applying the template

As I just found out, you can add -Dbackend_max_links=1 to the meson 
command line instead if LTO is enabled.

Paolo


