Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB883322FC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:27:39 +0100 (CET)
Received: from localhost ([::1]:49540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZaU-0003F2-RY
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJZXL-0008F5-0u
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:24:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJZXH-0003CU-H1
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615285457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7uC5ZEEGxCvAmTNA1SJF3BjTzH4EiwSLyxrIsDBEoE=;
 b=K0rbM72/nTbD+J0UjQ8n2aVN7mwpPiTST76CzfVQCwtraKZw4SUkvIbBrlwftz8v8CXo8s
 f4VFRBQhysuxtY4qnjS45epqzLC34DNoLJkuc3Mt0eR0hWB5ySJIuKHVVtTHGFDKlnhfRJ
 i8v+7aE744XtVLCJdIFkKe9qiLc1gco=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-oxovwHkxNKuNsuTLGLEuKw-1; Tue, 09 Mar 2021 05:24:14 -0500
X-MC-Unique: oxovwHkxNKuNsuTLGLEuKw-1
Received: by mail-ed1-f70.google.com with SMTP id w16so6499354edc.22
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a7uC5ZEEGxCvAmTNA1SJF3BjTzH4EiwSLyxrIsDBEoE=;
 b=PsD1sSXDPpyVRzzbPlexz3yspuBSGyNav610b0rPITNxT/LDY1bHFfsNZbbHYFJiZp
 QX18xhNmXo9+DLkkhGabfEchYyIAM5jo2H0wk9HpmLq+vsCkzMqfsMJzugmFaOx/b/os
 PL8z+5XMtHnZX6MK8z4VTW17ahnBXWTQGkhHK/0zIntoYt607NjPyXqol2IlIB7tT16p
 Wo1O6uR3nSTFRZ24NnTHw1ifRz9gEYP8+IJdWnQNaFWGfieKH589am2sxUW1qaIgHiGN
 IYh0eWfuLf8MXiY0ZsQIwTVf22QfuH0CtaQNrLuGxh+lFhlFmlbFalrhTlyJB5omSVQR
 ox9Q==
X-Gm-Message-State: AOAM531KY8wNxcCS13oIyua626VT7deFYNkxxJxLAngbdNuo7kU7TXFC
 03aAjTMeVcgg1rTyo4W/pWgZghl7GgceTFFNE3Ptihe7SdPYaUqW0AZipCw4y2XDdG1T3Rw1bHK
 puzvDBcOJGWDMBA0=
X-Received: by 2002:a17:906:ecfb:: with SMTP id
 qt27mr19022489ejb.245.1615285453766; 
 Tue, 09 Mar 2021 02:24:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7ZB/0NNTIAAGiTw6sbilgiHhybrWCZvUWjpI88N/PAoAHRqf5+5cb/a+WTFHHaZQ3dKmpiw==
X-Received: by 2002:a17:906:ecfb:: with SMTP id
 qt27mr19022479ejb.245.1615285453656; 
 Tue, 09 Mar 2021 02:24:13 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id fw3sm7842864ejb.82.2021.03.09.02.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 02:24:13 -0800 (PST)
Subject: Re: [PATCH] coroutine: add libucontext as external library
To: Joelle van Dyne <j@getutm.app>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210309032637.41778-1-j@getutm.app> <YEdBce6TWCVpSph9@redhat.com>
 <CA+E+eSBt5sq08zfxLOZKNQd=A3q=9YLEt0moipTb7j+OGWyuRg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <537a6a0e-431b-3920-c8dc-290e4e3d8895@redhat.com>
Date: Tue, 9 Mar 2021 11:24:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CA+E+eSBt5sq08zfxLOZKNQd=A3q=9YLEt0moipTb7j+OGWyuRg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/21 10:59, Joelle van Dyne wrote:
> Does it make a difference if this is provided as an option and not as
> a replacement? Would it make sense to add some warning at configure
> time? Right now none of the concurrency backends are supported on iOS
> and it's possible support will go away on macOS as well in the future.
> QEMU would not be able to run at all.

The alternative is to use a handwritten backend, it would be necessary 
anyway for CET support.

You can find the patches at 
https://patchew.org/QEMU/20190504120528.6389-1-pbonzini@redhat.com/

Paolo


