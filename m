Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A00B18D61C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 18:42:13 +0100 (CET)
Received: from localhost ([::1]:57040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFLeu-0003Md-Ir
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 13:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35515)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jFLe4-0002nJ-BP
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:41:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jFLe3-0000zG-5C
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:41:20 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:52762)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jFLe3-0000xe-0W
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584726078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJ5aCjWuh20eMr0+wBa36ot/9T0o3gfaqJpDQ6z4yKU=;
 b=b5CpKeBDwo8WpYwJlFg7cEjFxoCVzDVSRr0QpxrIoFx43ACA5hN4sfJNg/UzHRzxxYZ3/Z
 J609tm6LqojvKjYjHao7lyovVqqYVIBUSxpyn9ODvDb/lkcp+C1NL7UEEhzR/LhdyRl+xh
 bbJ0OX4muG0qQSRK1WlVB2kFh22v77k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-qcxKEva5NWahqH1VHaZMWA-1; Fri, 20 Mar 2020 13:41:14 -0400
X-MC-Unique: qcxKEva5NWahqH1VHaZMWA-1
Received: by mail-wr1-f70.google.com with SMTP id t4so2972881wrv.9
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 10:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BJ5aCjWuh20eMr0+wBa36ot/9T0o3gfaqJpDQ6z4yKU=;
 b=lF0dy1/POHa04H9w0Ur8tNBWtT68dY54MYkzCljZJScFah3Xu4WOw90Jgj848kfXpC
 Jfaq1/OeLQjpOXbSPj2E4eE+MbX5vgoP4hq3gHyEoydxevi7pCYcg885VejEnJirbAay
 4rd2PY/+O8sFwm3VIYGRNtwayXo8r/TvtJwxkAYjsAiroxbY4wq6qKY6K9ozKNsNpiCL
 U7ImLMhAuHOihGaGRZ7DZNkb5+x+kDGhTfBhofmbkZLynOB0exZhm/unMk4b8e34gQXX
 qsTdxT9tEp03fuaQD4HI8c5iIc4GC9kdRPtiYULuGN1QEMazfDxkl8m3nTuPVKqJOHDe
 Hbfw==
X-Gm-Message-State: ANhLgQ0XCS2C4pzKm2hL9TrkKa2x7pw2a5Guok+xFlH1ADodeW466+pp
 IVzejhQpl9297ki0zL93o7500YOHBO2VibeuJNsDmRVBGTqceaWraHacJlsOU1pZbG8RnDd6XCo
 M+Ss2usKqFr8ZzPg=
X-Received: by 2002:a7b:c30a:: with SMTP id k10mr11387930wmj.20.1584726072616; 
 Fri, 20 Mar 2020 10:41:12 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtjrBwwaYOi13TP31tXb1XLeh23TNzF/iCHmyHNg30m6CjeHBck2j2xL9eSRnNj8yAA6zNm1g==
X-Received: by 2002:a7b:c30a:: with SMTP id k10mr11387912wmj.20.1584726072384; 
 Fri, 20 Mar 2020 10:41:12 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.15.43])
 by smtp.gmail.com with ESMTPSA id t5sm8317761wmi.34.2020.03.20.10.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2020 10:41:11 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] scripts/coverity-scan: Add Docker support
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200319193323.2038-1-peter.maydell@linaro.org>
 <20200319193323.2038-7-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7f9e9847-0f65-26dc-79de-f273c5492f66@redhat.com>
Date: Fri, 20 Mar 2020 18:41:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319193323.2038-7-peter.maydell@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/20 20:33, Peter Maydell wrote:
> +    # TODO: how do you get 'docker build' to print the output of the
> +    # commands it is running to its stdout? This would be useful for debug.
> +    DOCKER_BUILDKIT=1 docker build -t coverity-scanner \
> +                   --secret id=coverity.token,src="$SECRET" \
> +                   -f scripts/coverity-scan/coverity-scan.docker \
> +                   scripts/coverity-scan

I'm not sure but tests/docker/docker.py should do it.  I'll test this
next week.

Paolo


