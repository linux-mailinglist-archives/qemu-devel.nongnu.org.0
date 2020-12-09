Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C52D41D2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 13:13:03 +0100 (CET)
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmyL8-0000ZK-R8
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 07:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmyJh-00005e-Gu
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:11:33 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmyJf-0007vm-Sv
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:11:33 -0500
Received: by mail-ej1-x631.google.com with SMTP id f23so1797282ejk.2
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 04:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SOD3NreGo1V885+N/yx+58IbyIp4/uSuO02wnwe4frc=;
 b=wWRSzdIavlr7kGZIcadG/FTN/iLcl1Ij7GNOFt0Jj/nlNDdBoJejXbP5ytRhSJhgTp
 YxzGCidXay137BhhnDtw3/TTqMET/azT7gYBWg9IUdYh1utZgKaxQNP55GWvH3eE2CF1
 Sy8oKyplKlLakXI6Xu69CD/xNWFDOoxs+/5bHU2ZRzEQIZIrG/qcrFxs/IQKt4JWUzIH
 N5kXuU1nIWK0bm/Hsybgu+0hgEFg9Q1prBwGmqNijfniIhhtlOfnC0asU/xaEI4T41be
 1sHUxHwgb7moQoNOGQepRAThpn/e5RUQG5ZpPgmWMLF80PqNJeQBHKKgep7rE5slONoz
 zZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SOD3NreGo1V885+N/yx+58IbyIp4/uSuO02wnwe4frc=;
 b=C7rfD1QMwZbCx3Skh3CYIBXacX+R/0XYz1S9GxIP4K1yhviXhH9rxHh5mWLfwrONHk
 KKJzNjwG0jGmv67FPvxydUlQCoQgzdtidJqMezj+ZqqTapZRCMf0mYoD6a1nngsYyVbJ
 0TGBYQnLK+3LicFBMydS3KYTgBxUdXWFnnTQuz73p3TTcsgNgmJ7Z2+1iXkOPrA4IgZQ
 tTzWIQHKXGCU+WGp5fMiy1ltfY2QJkR7dJh4+WU5sF05IF7IzdT26dfJ1Zv5OGL2PNCr
 fFQbiaQtXi3b7rrNdhOQAxBUcAgW5TvPOC2Ige1Lu/TcaTND+7h3ERjvyoYcKQh/3hxI
 RHWQ==
X-Gm-Message-State: AOAM533vOwouhUmTUJKiUpiDU6TBY4DXZptUQ+zxcgY8R4dG8UtnXZCs
 499RtsbEDre/QmDQOicik9/rEzZGmwzKVg==
X-Google-Smtp-Source: ABdhPJwKloWSEagTjkk8raL7EJENz4cimPidy+K3gclxgMeYO85W/5JeRQLX3vwE0U9UG2lqhBTsZw==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr2398055wru.118.1607515393661; 
 Wed, 09 Dec 2020 04:03:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l8sm3085868wmf.35.2020.12.09.04.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 04:03:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6750B1FF7E;
 Wed,  9 Dec 2020 12:03:11 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-25-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 24/32] cpu: move cc->transaction_failed to tcg_ops
Date: Wed, 09 Dec 2020 12:03:06 +0000
In-reply-to: <20201208194839.31305-25-cfontana@suse.de>
Message-ID: <871rfzdw5c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

