Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF0A2F12FD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:03:35 +0100 (CET)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywr8-0005Wh-Ps
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kywdq-00040W-VQ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:49:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kywdl-0000Vq-I1
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:49:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610369384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G50AcNmNUzXteh02pa00nGdMyEXtmxfUvw2I1CVab+o=;
 b=Qarwn9F83kDqleSX2QGdxSlagr8Ref+rWO6XBIDsLaJuO9VVGlRLfSBoxoTIAP6sGetr8j
 w4sYIFodTsrgaACTLasVpX+wwCpa3lfDYwMmFcQwfyCzHVtgxuj2m/hZdCzjLePq9MubRO
 x1hjunEYGDKMN6IXrdfZwq17KN+78fM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-u1TysVP4PtKhdUm3HtbOjQ-1; Mon, 11 Jan 2021 07:49:40 -0500
X-MC-Unique: u1TysVP4PtKhdUm3HtbOjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65E691084D66;
 Mon, 11 Jan 2021 12:49:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-147.ams2.redhat.com [10.36.112.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F274360C67;
 Mon, 11 Jan 2021 12:49:34 +0000 (UTC)
Subject: Re: qemu bsd-user plans
To: Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>
References: <CANCZdfo_CDqyG339HwNQb_K+sbsV0t+3nJMXVFf=mYrS3nsv-Q@mail.gmail.com>
 <CAFEAcA-UUFng5AwFgOEKiQqR3XQEQa+pBejisuFvhUqqfxMA8Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b92f9183-d552-d294-89a8-d18f17c679b1@redhat.com>
Date: Mon, 11 Jan 2021 13:49:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-UUFng5AwFgOEKiQqR3XQEQa+pBejisuFvhUqqfxMA8Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Ed Maste <emaste@freebsd.org>, Kamil Rytarowski <kamil@netbsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Bruno <sbruno@freebsd.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Brad <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/01/2021 20.56, Peter Maydell wrote:
> Adding the people to the CC list who were on the previous discussion thread...
> 
> -- PMM
> 
> 
> On Fri, 8 Jan 2021 at 19:43, Warner Losh <imp@bsdimp.com> wrote:
[...]
>> So, my new plan is to rebase what changes I can to the tip of master and submit those for review. I'll work with the developers on the FreeBSD side to ensure they are included in reviews in addition to the normal qemu-devel list. This will allow us to pare down the deltas between our code and upstream to allow us to make progress. The changes will be held to the standard 'makes things better'. Given how broken bsd-user is today in qemu upstream, at first that will a very easy standard to make.
>>
>> The first patch I'll submit will be changing MAINTAINERS to point to me, since I'm acting as the point person in this effort. I'll then re-submit some other changes that I've submitted in the past, but CC the FreeBSD folks that are currently active (they were only CC'd to former developers who lack the time to review).
>>
>> But before I get too far down this path, I thought I'd send out what's going on to qemu-devel so I can get feedback and adjust the plan into something that's mutually agreeable so time I put towards this is not wasted.
>>
>> So, what do people think of these plans?

Sounds like a good way forward. Are you familiar with sending git pull 
requests? I think once the patch to MAINTAINERS has been accepted, it's 
maybe best if you send out pull request on your own once the patches got 
reviewed on the mailing list - otherwise it might get cumbersome to find a 
maintainers tree where the patches can go through.

  Thomas


