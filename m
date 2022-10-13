Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD935FDCD9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:09:28 +0200 (CEST)
Received: from localhost ([::1]:55364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oizpv-0000cO-Dw
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oizma-0005Cw-K8
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:06:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oizmK-0008N7-KC
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665673542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S7IyEG9q4CD1KsDUEh17Zrq0601sniWLGuZ4CwuhZ3c=;
 b=N6gsNt+m0jSGsyUqqkjv2WGCvK38i47X+oSrX8gi54vzATMiyzCJNfVGSTYlVMwdfZ0YWN
 6xsQGOeK9M9TmVbKs6VolummKzBLXPlxiz+0ffvMTBdZB8/kuLMWLLg2+4avJ3J964tRPn
 vFeEMzaWNtnp8P+j6F+U2AyouQh2zDA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-AfLMi43vNhWge4-hmTAMgw-1; Thu, 13 Oct 2022 11:05:41 -0400
X-MC-Unique: AfLMi43vNhWge4-hmTAMgw-1
Received: by mail-qv1-f70.google.com with SMTP id
 h3-20020a0ceec3000000b004b17a25f8bcso1543114qvs.23
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 08:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S7IyEG9q4CD1KsDUEh17Zrq0601sniWLGuZ4CwuhZ3c=;
 b=V4yL5CE7CY/7XQR6LiiR8IrmMcQG8MpK21lQFqTKjHGlZw2mzj4pv+zPHjFY/QDW0K
 BF0N3wJLT2tgyJF/ZZGHoBfIjiucG8qGgTluerPnDOydBs/MtU/kIo7iN11DhvdyDBv1
 5qG8WIdmlbKuJT/pD+anOyS+qHFuXeeQdDvGT8HxS7ieQ1YhIivI0ArbWPqNdbdiFPol
 +H0q64z8xaWlwUIwSTbEya2qIQh+uqkwbjpGP8N3UmypcjZxqoQF2dw/NI36JLkryNzV
 dOyFzo3eRpsqUpTsJbFAT+q3xTDJnMKgQDLsU5hSmZ9tLAdMtOgA/QosLcjlNzK0VNpF
 BesQ==
X-Gm-Message-State: ACrzQf2LF6Lu79VRIw5MsuqvSYXApqH2XSacYXErO+nkgi3yOuuFzZH7
 31vg/yxBIhyD/bvjrc72QSAVxMPgWhTekgy3Tfp/DaF+yUK+5LCEkw1yF08pS9a/M816ualx3BW
 8+mBpIAuWQM8OJ9E=
X-Received: by 2002:a05:622a:7:b0:39c:14ff:32bc with SMTP id
 x7-20020a05622a000700b0039c14ff32bcmr176149qtw.125.1665673540458; 
 Thu, 13 Oct 2022 08:05:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5IHNB1N6c6C/DNFtVPjtxfiZwyhlEh7PtDBeikzjJBNyNsgfS6W95G3cGI1TZ8Btn95umLuA==
X-Received: by 2002:a05:622a:7:b0:39c:14ff:32bc with SMTP id
 x7-20020a05622a000700b0039c14ff32bcmr176119qtw.125.1665673540138; 
 Thu, 13 Oct 2022 08:05:40 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 t4-20020ac865c4000000b0039ccbf75f92sm108530qto.11.2022.10.13.08.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 08:05:39 -0700 (PDT)
Date: Thu, 13 Oct 2022 11:05:38 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Yury Kotov <yury-kotov@yandex-team.ru>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 0/2] qemu-thread: Strict unlock check
Message-ID: <Y0gpQtnFizo1e20U@x1n>
References: <20221011224154.644379-1-peterx@redhat.com> <Y0cEjAT6yMX/Xasv@x1n>
 <CAFEAcA_wvnwoSo8jnddEJ5+87xxRdXLpR0r-20E5JkLTTXXbzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA_wvnwoSo8jnddEJ5+87xxRdXLpR0r-20E5JkLTTXXbzQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Oct 13, 2022 at 11:31:20AM +0100, Peter Maydell wrote:
> We used to use PTHREAD_MUTEX_ERRORCHECK, but stopped because it
> does not work with the idiom we use for handling mutexes across
> fork() where you take the lock in the parent, and then unlock it
> in the child after the fork. With glibc's implementation of
> PTHREAD_MUTEX_ERRORCHECK the unlock in the child fails. See
> commit 24fa90499f8b24bcba29 from 2015.

Oops, thanks Peter.

-- 
Peter Xu


