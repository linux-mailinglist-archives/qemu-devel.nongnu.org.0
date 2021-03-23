Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 153AE34591F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 08:56:48 +0100 (CET)
Received: from localhost ([::1]:50098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lObuB-0004qf-6Y
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 03:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lObsi-0003dU-Nk
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 03:55:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lObsg-0006MT-6K
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 03:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616486112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JoyFBNe/WIGiSWpbiV9WZWZGJly2+QXzHmCyU1tX/aQ=;
 b=A8/zjniEk/5n8C4E1e4iEy4tVl6HDLiaysInlqnh8sIFVk/w2KeCi6535oLaNSuABY6Ui2
 oLbrxt07fcEsy7h8m05XPp9aa2oxtILe1bZizvtJRSvtYCQK5QTS9yXcxGnEG8i1MUPnZk
 LP7Q1MDuLIizWks+CovS2AeIgXFDCDI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-BQAJkcLPPYyazLBdKEWiaQ-1; Tue, 23 Mar 2021 03:55:10 -0400
X-MC-Unique: BQAJkcLPPYyazLBdKEWiaQ-1
Received: by mail-wr1-f70.google.com with SMTP id y5so735964wrp.2
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 00:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JoyFBNe/WIGiSWpbiV9WZWZGJly2+QXzHmCyU1tX/aQ=;
 b=c3NV+BxQ3rR4uQv9QGPN5b33WNX9Oo7W6eYWDCAUvIE6I7ouglCH6j1liYdiobbW6u
 phqK4XD+ndnq4vj1lz7BOeMmDN29YQ8mLBQUCrjiSHeNuFmUTn0LyQxvUI2LW0R+o2F8
 lABGjDpEEezAeNvucgvKGTvnZ7vnz/yLaEX44i9IDare/rNwI0NcBqirX1/XUPqVkIWk
 Wi+397KsGqfIFeLqmgG18rLeiuxzora6fAGDQr9ti2EVRaG3S1uaXjOyFIHw9yXicWH1
 y8u3hvDRZ62Bi+2Hh1IWP8gvlPpv4nl3kzEhxtQWa+H96Ane7pPUPPS8AcKBKq8DjQc4
 kVoQ==
X-Gm-Message-State: AOAM53211y28eWZSJJ21EXZm84WfcmjK9yDwUPZ9pi8Vj4r8wGqkf14F
 VI1LXTtk9uA5K2iIzjs/wE+D0R2plInV6KYo9ZDhaGTzT2QAgr6PJOC9qMMlcPE+gxrHjcygli2
 R/XEirQMBxanvvQ2xG3XJWFuZnhBG5wDej1SwMn5s9klt0I5qta+wjTpK7Jxu55nEtBk=
X-Received: by 2002:a05:600c:21d4:: with SMTP id
 x20mr2073228wmj.58.1616486109383; 
 Tue, 23 Mar 2021 00:55:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWXA9v92W7yzOhIKGOgcS2/6xRvAv/ldzDsq/2v2lgwutBBdbrOnhg7oGzAoR5wjqcOsMvsA==
X-Received: by 2002:a05:600c:21d4:: with SMTP id
 x20mr2073198wmj.58.1616486109084; 
 Tue, 23 Mar 2021 00:55:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id v14sm21662237wrd.48.2021.03.23.00.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 00:55:08 -0700 (PDT)
To: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210322132800.7470-1-cfontana@suse.de>
 <20210322132800.7470-2-cfontana@suse.de>
 <e972fe2e-3871-422c-f85d-baea7066c55b@redhat.com>
 <2019426d-3515-2a87-5b12-cd6d877b0553@suse.de>
 <1c5870b0-4ffe-afec-b852-fa895592ecf0@redhat.com>
 <66e9d4a3-0309-f6b5-6541-99a2091fb6a3@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC] accel: add cpu_reset
Message-ID: <820cd2fa-5a02-d841-ae70-f557d1792876@redhat.com>
Date: Tue, 23 Mar 2021 08:55:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <66e9d4a3-0309-f6b5-6541-99a2091fb6a3@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/21 14:51, Claudio Fontana wrote:
>>
>> It is possible to include calls from one sourceset to another (including
>> from common to specific) as long as the conditions ensure that the
>> symbol is defined.
> 
> I guess this last sentence is the more tricky for me to get: "as long as the conditions ensure that the symbol is defined".

It means that for example you need to cannot call block_ss code from 
common_ss without any condition, because for example usermode emulation 
targets will fail to link.  But you can freely call block_ss from files 
that are system-emulation only (such as hw/block or hw/scsi).

And on the contrary, as long as all specific_ss file implement the 
function, it is fine to call it from non-target-specific files without 
any condition.  This is what happens already with (for example) monitor 
commands that have a target-specific implementation but are present in 
all targets.

Paolo


