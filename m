Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE3C6076F0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 14:33:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrDN-0000zm-E1
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:33:29 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrCB-0008Pm-KU
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olrBf-0008D7-No
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 08:31:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olrBc-0006f1-BJ
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 08:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666355499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O0x/dK80y/sqaMMIS7iy1dKaE5CAGMUMw8bYnbWU8Kc=;
 b=DEjgJ3OhACKXuD3ihqHqJyZishhcB/+Gw1ldCU37yq+Eu18a5KilmoAehP1TM5p3WI4qQO
 Lm4yYVB/iPrkcInAgyITZJenUF+8XWgCjLiGJOeU63jhT7Yzmemvigs99bmOdNJzMfte3G
 JXNig6wzVKUVwIbuFoT7OuFE2HFoinE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-VOnh14kINea2HxDUXyPV1A-1; Fri, 21 Oct 2022 08:31:36 -0400
X-MC-Unique: VOnh14kINea2HxDUXyPV1A-1
Received: by mail-qt1-f198.google.com with SMTP id
 fy10-20020a05622a5a0a00b0039cd5097697so2413947qtb.7
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 05:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O0x/dK80y/sqaMMIS7iy1dKaE5CAGMUMw8bYnbWU8Kc=;
 b=Z2nkaP/aPb46qoCxwiRnIafEUBvRSgInlioEujHEJkgJNVilWGMi6dtQxHrM92mQ1t
 9aXjq2Q4UDT6DCFX2iifwf25wSG0vpo0IV2bCG3IftnC0nMUgzh6qxLxSk9EWLz13WKs
 m9eG1sMO1GjSzArFdOhAN9Ql+YbfewAQiy1ifuPWIS5klEq6UZ4irJZtAeYQoazByMOB
 8Z1KbUkWytr6DteqSHn2D7jGvdrYDIoRUXmfSRhqnd59ErN3A+RCS1+0c5M49myiM7oW
 r9kXIWVxLFnxr9GUiV7vwoU0t2ZuNhxBsjJyxQar8QO022n8xe8GgWYoY8uXI7ZcT4ud
 7q3A==
X-Gm-Message-State: ACrzQf2QU9ti03BSDDin46EML3QiHi1VON0mgL5VfewOlnUk23K9FB32
 vmJJSghHBxhIy8+ISl+gWbjoAox0SNO7LG+Lx2K7Cr9X2NmPEOsE5vGiF71BylLdcfRq4/3nf3a
 TT6ylMR4ohNBu6ZOvirKQszVTsYljJZvm69n6kRMnoQH5xQ6De54eso+Qf1ZVkwc=
X-Received: by 2002:a05:620a:2892:b0:6cf:60a0:84ec with SMTP id
 j18-20020a05620a289200b006cf60a084ecmr13062176qkp.574.1666355494459; 
 Fri, 21 Oct 2022 05:31:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5q5Igg/5j9OgmWz/psmyTPe+cd4kkzJvdxVcjGA6h7M47pjXrVBN8gSDnbMaFLZnftU4M8EA==
X-Received: by 2002:a05:620a:2f5:b0:6ee:82ea:b531 with SMTP id
 a21-20020a05620a02f500b006ee82eab531mr13675454qko.324.1666355483969; 
 Fri, 21 Oct 2022 05:31:23 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-110.web.vodafone.de.
 [109.43.178.110]) by smtp.gmail.com with ESMTPSA id
 n12-20020a05620a294c00b006ced5d3f921sm9793590qkp.52.2022.10.21.05.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 05:31:23 -0700 (PDT)
Message-ID: <3b8f8249-e8ed-b129-18d8-f132c4e23e44@redhat.com>
Date: Fri, 21 Oct 2022 14:31:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 00/10] dump: Add arch section and s390x PV dump
Content-Language: en-US
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Cc: pbonzini@redhat.com, mhartmay@linux.ibm.com, borntraeger@linux.ibm.com,
 imbrenda@linux.ibm.com, pasic@linux.ibm.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org, seiden@linux.ibm.com, scgl@linux.ibm.com,
 Janosch Frank <frankja@linux.ibm.com>
References: <20221017083822.43118-1-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221017083822.43118-1-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/10/2022 10.38, Janosch Frank wrote:
> Previously this series was two separate series:
>   * Arch section support
>     Adds the possibility for arch code to add custom section data.
> 
>   * s390 PV dump support
>     Adds PV dump data to the custom arch sections.
> 
> I've chosen to merge them so it's easier to understand why the arch
> section support has been implement the way it is.
> 
> Additionally I've added cleanup patches beforehand which clean up the
> GuestPhysBlock usage.

As far as I can see, all patches have been reviewed now ... Marc-André, do 
you want to pick this up for your "dump" branch, or shall I take it through 
the s390x tree?

  Thomas


