Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C85555EBA6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 20:01:49 +0200 (CEST)
Received: from localhost ([::1]:33530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6FWy-0006dc-N1
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 14:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6FVb-0005vT-KO
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 14:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6FVY-0005VK-A9
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 14:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656439215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/CQlJ6SIsPJ5yEsg0yMStb89UPH1SZg/GyaPLALCpE=;
 b=UC3VyrxP9MarvpmZH65ufbogfcJE/3jQ6t7LPZOq9gC6YaP9y+gN4YvRCZ+eZjG8BmW2ei
 Qqqo6TwBZot0LUDtfNn+IDhoErfIEanbyjcfeINVw/V+3ggLEQ0DRXdEycks4jdh0agpg6
 y1E075d7cGSXgRqBw/iN2px6CzuuKw8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-9DejrrqkPbm108i-14qd0A-1; Tue, 28 Jun 2022 14:00:12 -0400
X-MC-Unique: 9DejrrqkPbm108i-14qd0A-1
Received: by mail-wm1-f69.google.com with SMTP id
 z11-20020a05600c0a0b00b003a043991610so5070569wmp.8
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 11:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=w/CQlJ6SIsPJ5yEsg0yMStb89UPH1SZg/GyaPLALCpE=;
 b=DniV0plQmN/ZJCa3ImwkaVDWsY+ce3rvDJuF06jTeZFqcSPv0tu/AZN/75nNvf33/w
 J6SfvhOOGGTdlMc/gHqOT5jghJoFUT2si05XxRsiKs4dVbPfcl2oM+uIyT/yKrpcbc3w
 c3Z4p2mDdTRkq75q9UtpQY+JwKaiI74txa95LMhzxnncdej8w1IFzry77r61mz1/ApMo
 jaMgEFV7Vh5NA0zVmHUaPBCS4wHWuQd84dTLJoAsIwUvv+TqzVZBrQovOIm+hHg740Pb
 ewKNkFSxM3r8GcTQZSvnEwXmCFzX0VU7UJ9zcr6EPkSk7iNdTLZ1qdZIllKbZgbDzt3U
 LSag==
X-Gm-Message-State: AJIora+gtv6HL8XMYAfkf3CwFh0KNR81Vb1u19Z877u9aB9l89L8NYQX
 /Qyw8VDTAcf+O+fzIKQO+pWe8b+knafLmtFvHqzN8MUynnLJSbZvkyJqF9uZkN5tdwhBBOgTWBE
 8cDQjqcRjHAv7P6g=
X-Received: by 2002:a05:600c:3553:b0:3a0:519b:4b96 with SMTP id
 i19-20020a05600c355300b003a0519b4b96mr891456wmq.61.1656439211648; 
 Tue, 28 Jun 2022 11:00:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tjuwyVksuqM0EHmRqRlzwmoV8OgNQSrWn9wrZafidLaEoZ7+dKOvfsj0ZWUa2hSKK9MVIXtw==
X-Received: by 2002:a05:600c:3553:b0:3a0:519b:4b96 with SMTP id
 i19-20020a05600c355300b003a0519b4b96mr891417wmq.61.1656439211359; 
 Tue, 28 Jun 2022 11:00:11 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a0375c4f73sm224988wmq.44.2022.06.28.11.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 11:00:10 -0700 (PDT)
Date: Tue, 28 Jun 2022 14:00:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220628135133-mutt-send-email-mst@kernel.org>
References: <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
 <1182d647-bef1-0a8a-a379-86f029af7ac6@redhat.com>
 <20220628070151-mutt-send-email-mst@kernel.org>
 <2c3bb7f4-45cb-9c13-4ecd-22de75eaa7d3@redhat.com>
 <CAARzgwx2x5UBvb9ihbvLRzUFNJ3reqDsU2EqL8aUjkjo8yvZGQ@mail.gmail.com>
 <YrspCYpLwFDHkaRv@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrspCYpLwFDHkaRv@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 28, 2022 at 05:15:05PM +0100, Daniel P. Berrangé wrote:
> FYI, the reason much of this is intentionally NOT under the /qemu-project
> gitlab namespace is that we did not want to be responsible for distributing
> arbitrary binary blobs/images. That in turn makes the QEMU project responsible
> for license compliance, which is non-trivial todo correctly for much of this
> stuff. As such it is highly desirable to delegate both the hosting the
> binaries and source to the third party who builds it.

This might be understadable for random guest OS images which include tons of stuff
and are thus hard to audit.  But not to biosbits which has its own
license (more or less bsd) + gpl for grub:
https://github.com/biosbits/bits/blob/master/COPYING

> I agree the use of personal github accounts is not nice, but it was the
> least worst solution identified.


-- 
MST


