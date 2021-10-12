Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D5842ABC5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 20:18:15 +0200 (CEST)
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maMLt-00049k-TV
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 14:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maMJL-0002IM-U1
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 14:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maMJJ-00037R-Hd
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 14:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634062532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIh0okyEUAkVdmZAUllcreo+zrao+z9YIDhOw+QDGws=;
 b=f57XMvUCSOUznbV3BbWEwZ0ryyHAEQfQZYQ7hLt4U65+Z6/TSsGenhF4eVaYLD+Aa2YZjt
 sIhHlX7B1eBF1+Mkwn+t2sdMBEi4k1xWkUoLBtnGfBQGy77H/AjjESvNP2ihYtsD35UqoK
 CdS1zNgDKtXORZSu3DcVPulvLvuY9jY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-Ch-d02F1Pc2ds8HE7eSknQ-1; Tue, 12 Oct 2021 14:15:31 -0400
X-MC-Unique: Ch-d02F1Pc2ds8HE7eSknQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so726863edb.8
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 11:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SIh0okyEUAkVdmZAUllcreo+zrao+z9YIDhOw+QDGws=;
 b=Y73+ejASJ226gkEfFxwM6Sb6ACCZCIrU2vHleo/2hRZ6NI/MLu7czqHwTSKlD9o3P6
 bb4VG/cll/YQBUUkil3aybxrmiXTr8eREXDoL2NE8LKzChieOZNsh6vGJfjS03hsLjh4
 mqBhQNikpobgwtzAPVc0dcHrwaQv7BmCkhy6/H3hTbOZkLTxyzsahnuAUmfcQwi7xeYA
 OOhhmCvNiHjoz3JEX6nS7qQ+OcvF1F93iUqV3230LiZOWz42n2eqI03rLpRYW4DUC7M0
 L3cqqbhrYYT7d5r6FJH83AUk6aOTUn9rhrzeD5fIKZFr+yRF/dl0bz37bBvW/18rYvEJ
 ehQg==
X-Gm-Message-State: AOAM530PbFS/JIlJjjpN2q3sQHCxs8Ik1et7L+X5A9STD/dW3hJNPU82
 FriYM8F4XpbyC2runoODXTeQO/BjFV0XiZExUyXE7EtlsJnpZHXIezXkSzK82UKzmicEvfQ9c0e
 rB3wrPlj83w+q4bM=
X-Received: by 2002:a17:907:3f27:: with SMTP id
 hq39mr33359415ejc.352.1634062530478; 
 Tue, 12 Oct 2021 11:15:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNt+D+4ojh1sr5GmxKflZ6KkKAhUEYze1RMT4kF3/NA2/bVoz5Hb3EKAMRSmCvdYaQy7uNYA==
X-Received: by 2002:a17:907:3f27:: with SMTP id
 hq39mr33359357ejc.352.1634062530192; 
 Tue, 12 Oct 2021 11:15:30 -0700 (PDT)
Received: from thuth.remote.csb (p54886540.dip0.t-ipconnect.de.
 [84.136.101.64])
 by smtp.gmail.com with ESMTPSA id r22sm5265874ejd.109.2021.10.12.11.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 11:15:29 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-25-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 24/24] configure: automatically parse command line for
 meson -D options
Message-ID: <de0d99d9-8375-5f01-c0a6-8174b6f57b49@redhat.com>
Date: Tue, 12 Oct 2021 20:15:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012111302.246627-25-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2021 13.13, Paolo Bonzini wrote:
> Right now meson_options.txt lists about 90 options.  Each option
> needs code in configure to parse it and pass the option down to Meson as
> a -D command-line argument; in addition the default must be duplicated
> between configure and meson_options.txt.  This series tries to remove
> the code duplication by generating the case statement for those --enable
> and --disable options, as well as the corresponding help text.
> 
> About 80% of the options can be handled completely by the new mechanism.
> Eight meson options are not of the --enable/--disable kind.  Six more need
> to be parsed in configure for various reasons documented in the patch,
> but they still have their help automatically generated.
> 
> The advantages are:
> 
> - less code in configure
> 
> - parsing and help is more consistent (for example --enable-blobs was
>    not supported)
> 
> - options are described entirely in one place, meson_options.txt.
>    This make it more attractive to use Meson options instead of
>    hand-crafted configure options and config-host.mak
> 
> A few options change name: --enable-tcmalloc and --enable-jemalloc
> become --enable-malloc={tcmalloc,jemalloc}; --disable-blobs becomes
> --disable-install-blobs; --enable-trace-backend becomes
> --enable-trace-backends.

... and you provide compatibility wrappers now - maybe worth to mention it here.

...
> @@ -1793,18 +1427,12 @@ Advanced options (experts only):
>                              (by default affects only QEMU, not tools like qemu-img)
>     --enable-block-drv-whitelist-in-tools
>                              use block whitelist also in tools instead of only QEMU
> -  --enable-trace-backends=B Set trace backend
> -                           Available backends: $trace_backend_list

Old output with --help:

  --enable-trace-backend=B Set trace backend
                            Available backends: nop, dtrace, ftrace, simple, stderr, ust

New output:

   --enable-trace-backends=CHOICE
                            Set available tracing backends [log]

Why does it fail to list the choices here? ... it works for the other
options like "--enable-malloc"?

  Thomas


