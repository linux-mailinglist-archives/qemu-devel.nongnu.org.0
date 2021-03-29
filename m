Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDCB34CC41
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 11:06:14 +0200 (CEST)
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQnqf-0002oA-HJ
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 05:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQnoR-0001yI-Ay
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQnoO-0001to-4a
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617008631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLp0tKZe5K5HZgG2Mp3zVtKWkoeU+z0dGZ8x/c1QUP4=;
 b=Ryi8TlRK4h1yp7yhFWj6NfKZvhLcI/SH9rAb+7UiZTtFN5zJL6/RfR1mIZ26jN0g14UeK0
 8xx9946O8h09d04HZCzZor/3cgLI+ge1hry80P88GRH7wbeBpuhjENFf73KQgrZoB6lrN/
 MAIcHima4k56Kwg8z64JImKDgObfRwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-gJM_qUZHOqaIigKHxkF-pg-1; Mon, 29 Mar 2021 05:03:47 -0400
X-MC-Unique: gJM_qUZHOqaIigKHxkF-pg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ABD91019638;
 Mon, 29 Mar 2021 09:03:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3131919C45;
 Mon, 29 Mar 2021 09:03:41 +0000 (UTC)
Subject: Re: Request for Mentor Interaction - GSOC Proposal for Complete AMD
 Virtualization Emulation
To: Swetha Vipparla <swetha.vipparla@students.iiit.ac.in>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <SG2PR04MB25249AF2C2537C98D1D048BCE57E9@SG2PR04MB2524.apcprd04.prod.outlook.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7e620ca4-5ce4-63ed-a2d5-65c3d7f852af@redhat.com>
Date: Mon, 29 Mar 2021 11:03:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <SG2PR04MB25249AF2C2537C98D1D048BCE57E9@SG2PR04MB2524.apcprd04.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/2021 06.27, Swetha Vipparla wrote:
> Respected Organizer
> 
> I'm Swetha Vipparla, a computer science student of International Institute 
> of Information Technology, Hyderabad, India (IIIT H). I am currently 
> studying in my first year.
> 
> I would like to interact with a mentor in relation to my open-source 
> proposals submitted for GSOC 2021 so far.
> 
> The project I’m interested in working on is*Complete AMD Virtualization 
> Emulation*.
> 
> My Github ID is*SwethaVipparla*, and I have sent 4 patches regarding the 
> following proposals:
> 
>  1. Replace common idioms like if (s->len > 0) { g_string_append(s, ", "); }
>     g_string_append(s, "foo") with common helper functions.
>  2. Remove leading underscores from #defines: Identifiers with leading
>     underscores followed by another underscore or a capital letter are
>     reserved by the C standard. Using grep 'define[ \t]*_[A-Z_]' $(find
>     -name \*.h | grep -v roms | grep -v linux) to find files that might
>     violate this rule.
>  3. Replace calls to functions named cpu_physical_memory_* with address_space_*.
>  4. Convert routines with multiple goto exit-paths to use
>     g_autoptr/g_autofree to handle clean-up and allow direct returns.

  Hi!

Thank you very much for your interest in the QEMU GSoC projects!

Did you send the patches to the mailing list here? I didn't see them on the 
list here yet ...

QEMU requires patches to be sent to the mailing list, not to be submitted 
via pull requests. Please see this URL for details:

https://wiki.qemu.org/Contribute/SubmitAPatch

> 
> Please connect me with a mentor so that I can go ahead with my final proposal.

The mentor for the AMD topic is Paolo (according to 
https://wiki.qemu.org/Google_Summer_of_Code_2021#Complete_AMD_virtualization_emulation 
) ... I've put him on CC:

  Thomas


