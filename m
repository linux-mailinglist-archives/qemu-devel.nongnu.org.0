Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F76E40D29A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:38:02 +0200 (CEST)
Received: from localhost ([::1]:32958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQj9t-0007PI-DQ
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQj0z-0006Cb-JC
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:28:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQj0y-0007c5-8s
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631766526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NtkEALWgKxhk+WYZN9BQFVH7JpH5t2oo79nUtwnJRFg=;
 b=TXsEoiIGXrB0seQ57F8HvwH2g1FaMkVSbY6Sir1DtOH9pXa1rWv/EA1K80Pgj+RHKDPlIm
 x9btRP8r0kbKw842AsKKNzO+S1vMx31ZPu/vr3GC7Ze+EU3tpZEKBws6SL+VRPjxEsRu15
 nKjg4FjNn8IEo/r/WZpmp5dQ/K+bMwk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-NzdSsSj3PWaUBBTvJyzzcA-1; Thu, 16 Sep 2021 00:28:45 -0400
X-MC-Unique: NzdSsSj3PWaUBBTvJyzzcA-1
Received: by mail-wr1-f72.google.com with SMTP id
 z2-20020a5d4c82000000b0015b140e0562so1902978wrs.7
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 21:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NtkEALWgKxhk+WYZN9BQFVH7JpH5t2oo79nUtwnJRFg=;
 b=uGHezIRNmPXLAgN7xGGN4MdBxsgzYFAN+/wog+rkh20vJQac843ZuasXpjRbSmJvUO
 Ndj/0yadbjs+wuu96uMEnPGvOaDrQX3UH+5xPMn4oEPd/4v2Mkk/+eGR3z0ydSTJWdSF
 tVQy4Fv8mAC42Ls9tYATgZqab9ff7tQvMvDaZ6NC/cCnf/mwUptcnG1I9zkFXmkhO/wR
 amNxzvJ9pX9Ed1UfXkphMw2hEhoUsUokycUwMN/iXZYiE4DYmeYuhWlstO/mEvVYxV1J
 RyjvFr2dyMxrs6Fkpi6tI4xGDXmaT1/lUusiGwEiJOweML2EIHt4l19aBUk+DdVlVSMq
 lQ9A==
X-Gm-Message-State: AOAM5332WsOT1+5+Xytno3fLegMT78EPEJfl5yWBhj0ygR/0xGYu1z6B
 b5VF8+RmTrWmHUWuzLIHQpyIl+7m+POGOzOmOfUQ+hD+NIvfrojLzWeGfGPWgZxrhg861Gs+UBq
 pXmTWyOIl5o1f1OM=
X-Received: by 2002:a5d:53cd:: with SMTP id a13mr3601146wrw.33.1631766524025; 
 Wed, 15 Sep 2021 21:28:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU/Mh5q+CMNZsfj/iHLrxJmzq1Y4wrLPMHhgbM5osLQD9ay8d2Lb/QyBD6KxRzg48rKJoItQ==
X-Received: by 2002:a5d:53cd:: with SMTP id a13mr3601134wrw.33.1631766523902; 
 Wed, 15 Sep 2021 21:28:43 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id j20sm1945334wrb.5.2021.09.15.21.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 21:28:43 -0700 (PDT)
Subject: Re: [PATCH v3 04/16] iotests/migrate-bitmaps-test: delint
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-5-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8bf0da72-d32a-8de7-601f-8ae77b63d1aa@redhat.com>
Date: Thu, 16 Sep 2021 06:28:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-5-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 6:09 AM, John Snow wrote:
> Mostly uninteresting stuff. Move the test injections under a function
> named main() so that the variables used during that process aren't in
> the global scope.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/tests/migrate-bitmaps-test | 50 +++++++++++--------
>  1 file changed, 28 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


