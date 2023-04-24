Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315386EC5CB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:58:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqpDb-000332-Ah; Mon, 24 Apr 2023 01:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqpDY-0002r1-4c
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqpDN-0000Ro-Cq
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682315896;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUo2vwXeDrguXmVewn2/aOIIro4Uy/D8+1IlyiAOzXo=;
 b=Ru/VWEWAgy/A31DRYw/93c4iyCRi5eKwSBtkTKB3OKa4uTjrdpfOWiKLH2zMu8Nrb0uR21
 Da8r7NWn9YOHa2Zm8l/zpdI3Ct1+RoutyGg76RvPR0GD9G3z4UerZxcvGqGaI69wYGTNVT
 NGNQ5au3C0RoGHGOB2O1XWXRgGh8aak=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-IRkAERM3M3WUDGYWAwbCYA-1; Mon, 24 Apr 2023 01:58:14 -0400
X-MC-Unique: IRkAERM3M3WUDGYWAwbCYA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2f40f52c604so2223659f8f.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315893; x=1684907893;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hUo2vwXeDrguXmVewn2/aOIIro4Uy/D8+1IlyiAOzXo=;
 b=D4l+ldw6tsdiD9cR6lDaOWBLD+JG7KEP/bbnItXIIrVxFpSRwfeK4RaNyiTpKtYTGm
 43wCdF1muge3pNH6texHlli42jtjbNHMd5aDzNwmAIrqu5GKAwOgmzD6e2BGYlFCGXEy
 4xqTMIXA2uPAqx3Pc/pS9xvF2v4cL1j/gmswRLxOqJIRab2hfb3hxUuz7tuUTUnvvkyM
 QUY75QrWj+WrHCg8TS9eqy0PCz71aLvq4K2wLDADRvqyopGNeHWp3UGJ0rcUG6ZyeNv0
 xQLYRll+g15M6+QcmIDNFBpt6f7hFHtGr0emQbMx3Z3uFWBJcGw951du08szyvH8wRRo
 3MJA==
X-Gm-Message-State: AAQBX9f4+VXfglGtHkCDvrgqMzTW1Sv14MALSboZadUe7jr5sfwt+Tbh
 q2H7JY4CX2sFtoahc98GY/wtXwL1KtyrTZQdL7uJwn4t5u5k6BQyAQL48ltPjuJTaJ9XeVeTfus
 fNe47RPmBvo0HoE4=
X-Received: by 2002:adf:efca:0:b0:2f5:5538:2589 with SMTP id
 i10-20020adfefca000000b002f555382589mr8817524wrp.31.1682315893418; 
 Sun, 23 Apr 2023 22:58:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350ah9+gAu+Ch5SMkcO//gu5SiGpvshOksbgRAL8WGMIbEl4ysNFdLMtqdX2vy8rVtK404eqITw==
X-Received: by 2002:adf:efca:0:b0:2f5:5538:2589 with SMTP id
 i10-20020adfefca000000b002f555382589mr8817515wrp.31.1682315893153; 
 Sun, 23 Apr 2023 22:58:13 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 d9-20020adfe889000000b00303b72946b9sm7241139wrm.50.2023.04.23.22.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:58:12 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>,  "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>,  Li Zhijian <lizhijian@fujitsu.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,  Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 6/6] tests/migration: Only run auto_converge in slow
 mode
In-Reply-To: <MWHPR11MB0031E5A085809AEAA22AFB519B669@MWHPR11MB0031.namprd11.prod.outlook.com>
 (Chen Zhang's message of "Sun, 23 Apr 2023 02:41:35 +0000")
References: <20230421171411.566300-1-berrange@redhat.com>
 <20230421171411.566300-7-berrange@redhat.com>
 <MWHPR11MB0031E5A085809AEAA22AFB519B669@MWHPR11MB0031.namprd11.prod.outlook.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 24 Apr 2023 07:58:11 +0200
Message-ID: <87sfcpu8i4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Zhang, Chen" <chen.zhang@intel.com> wrote:
>> -----Original Message-----
>> From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Sent: Saturday, April 22, 2023 1:14 AM
>> To: qemu-devel@nongnu.org
>> Cc: qemu-block@nongnu.org; Paolo Bonzini <pbonzini@redhat.com>;
>> Thomas Huth <thuth@redhat.com>; John Snow <jsnow@redhat.com>; Li
>> Zhijian <lizhijian@fujitsu.com>; Juan Quintela <quintela@redhat.com>;
>> Stefan Hajnoczi <stefanha@redhat.com>; Zhang, Chen
>> <chen.zhang@intel.com>; Laurent Vivier <lvivier@redhat.com>
>> Subject: [PATCH v2 6/6] tests/migration: Only run auto_converge in slow
>> mode
>>=20
>
> What kind of scenario will the qtest open this g_test_init() -m slow to t=
rigger the slow mode?

The only way that I know is:

export G_TEST_SLOW=3D1
make check (or whatever individual test that you want)

Later, Juan.


