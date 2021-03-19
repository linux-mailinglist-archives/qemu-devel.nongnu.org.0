Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6CC341EE3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:58:16 +0100 (CET)
Received: from localhost ([::1]:36814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFdi-0005y9-7h
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFUz-0004NS-0g
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:49:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFUw-0007rZ-VH
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:49:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616161745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqUpf49Cj84L1DtcnfTB9G0j9EvstEWvObvzS4KNOPY=;
 b=NfcXtA8ehFoHtHH3D+i20KMED90ryuU5o+LbSHbYFRlPpLxCR1fmJILqk2/ixOCzPj6WPi
 tLgsG7r4U2x3gs5m1v8glrjdpVb14KFc83Xcp84GNq5GCmYkNpcU8EGlQ3k3D6KK4jJc8f
 YLOe4Afguvzy9bPuzgmOS7Qdymq1Dso=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-IimrmMp0Pr-EbsVREMb_rg-1; Fri, 19 Mar 2021 09:49:03 -0400
X-MC-Unique: IimrmMp0Pr-EbsVREMb_rg-1
Received: by mail-wm1-f72.google.com with SMTP id b20so7258057wmj.3
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IqUpf49Cj84L1DtcnfTB9G0j9EvstEWvObvzS4KNOPY=;
 b=eMFp1iNlpkfx5NV4L5h/SfgTVhMX7hHxFtZ2m1XtefQdGh12QJcZ2OntTLT+f6Vn/y
 iATF9xMYPaT9osy7Jd2v38MZW370GXwx6hOTaiyPZ/seHOSjhrO2LmzoDsKH+vAdUxK2
 QVwy4Jso9aJCalGqgU6cY5aXQ75H05RAUVg2xueub7hZ6Wooxw54OEKLe/yH/wMjyx9Q
 24UHgkrEACJja60cQGq7gwODEDVV7nOg7oetWBl+8KtxFy6ErErgiPhzQTqXKEqFJDqU
 b7vZWEDoOaOuI7MuyFsEe9h0A9w2JWryIg1vpyfMYFQpSR4HzvIHBE0ILrjDUj5reqbK
 rS1w==
X-Gm-Message-State: AOAM532yP4/6ZHbN6vUMiznJ71/U149hqM9pFf42MRbHK17JN4gjzcEc
 x1NBDt+MOLET13FHV7VmiVME9vpRsjf7ELU4MUeYNapLR8sdurgt5T214tzVh/uFegbL7oWbsGp
 wynWn8NSSkZU/zq8=
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr3791042wmq.91.1616161742911; 
 Fri, 19 Mar 2021 06:49:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh9EJ1IvgoX9f6ZRxjaI/QQ5T0YIoQ2rnzCYTWr3L7epAsiJWwxVKS6uNrO7qxT5GrcgOY5A==
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr3791032wmq.91.1616161742805; 
 Fri, 19 Mar 2021 06:49:02 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m132sm6406763wmf.45.2021.03.19.06.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 06:49:02 -0700 (PDT)
Subject: Re: make: /usr/bin/env: Operation not permitted on Alpine container
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <08d872e9-841b-5880-1a38-e6088cce69db@redhat.com>
Message-ID: <15fdbff3-b02b-9afe-2325-99945d2458cc@redhat.com>
Date: Fri, 19 Mar 2021 14:49:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <08d872e9-841b-5880-1a38-e6088cce69db@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 2:31 PM, Philippe Mathieu-Daudé wrote:
> Yet another odd error, this time on the build-system-alpine job:
> 
> $ make -j"$JOBS"
> make: /usr/bin/env: Operation not permitted
> make: *** [Makefile:51: git-submodule-update] Error 127

I clicked on [Retry] and this time it worked...


