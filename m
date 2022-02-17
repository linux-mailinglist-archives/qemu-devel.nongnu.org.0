Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9384BABD7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 22:37:00 +0100 (CET)
Received: from localhost ([::1]:36916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKoSR-0003Z6-Ev
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 16:36:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hamachiach81@gmail.com>)
 id 1nKmj7-0000Vg-HL
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 14:46:05 -0500
Received: from [2a00:1450:4864:20::62c] (port=41898
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hamachiach81@gmail.com>)
 id 1nKmj5-0008Jd-RX
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 14:46:05 -0500
Received: by mail-ej1-x62c.google.com with SMTP id a8so9732921ejc.8
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 11:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:message-id:date:mime-version:user-agent:to:content-language
 :subject:content-transfer-encoding;
 bh=q64cS3HSpP+VDaY4q5pUWhTKQMHvzJZb9NAFiNHeguw=;
 b=bTiiyUW9C5farhM8/QBw20i07ybT3MCH+lLVOj3da+b+NZx0pDK6lvpmZKvaWw0YK6
 d23JARUgARhLZK/RGyAv0X27Vcj9rbc9uYf1YrZZ9LT9WZRhsBXc4Z8WpI1kHcfjZ9I+
 IRqARcScmUMPmJBprQZulVoc9XvNm7jpNE+33k+k7KqZn5twSeAT1LY72+P3is+KUHey
 cO0fFK6aZVA4PoE5kFO8JuEEUcfarXhaQm9Vj6BkK7fDJ5F+cefG/BvwfhL5piJL7ViD
 sKWCdG+c7xz5za1IelzgFxmYkrBjfsgWWr1/+tmBluqk5U94F6vy+ZAyIuhJVfOJHiBm
 5eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:date:mime-version:user-agent:to
 :content-language:subject:content-transfer-encoding;
 bh=q64cS3HSpP+VDaY4q5pUWhTKQMHvzJZb9NAFiNHeguw=;
 b=FUBbXNk6TccRCAVtjVUqgK4YS04ACBkMX2BNuKJ2qRzFR18brV95HOaaB6ia2ChmX3
 m4JFfxCueYEaji2b/X6OYGRwsK1mqnxm/Zx2D10ChlLLTqKxt0SgfaHK1RLC3IlEHxBa
 7zDV2C4722wPRa0Wwwibb+ci0HoOu0zQcKXE1szafwxgoRF0mWLXKoHFdhM3Evvl/RI3
 /wnBp7AMfM3W8AGBi7kAenusx5m3id3eJu6ewwXp0B98anL7v1UEFeeQBFZLLzc2vhJC
 tzDi5DMmWZSZAVDzeSejlyaOpEJzhH/wIVkXx3xKdEAthZaYf02zlL8DLQ55lwKXKPQt
 q8/w==
X-Gm-Message-State: AOAM532VqjhntociCyzfItVRSrap3JfVKPlpr0K/tBE9sXKCrfQ0TfoN
 3hyCP7HaIM6b2u57/otwFBhDvJhaN84=
X-Google-Smtp-Source: ABdhPJxvXN/GOvGqN3BsuCieOk0FU7vM+vHsGUOOPumdArfGjVkW/D7rztle9KnEdlpugjOvDW3Aeg==
X-Received: by 2002:a17:906:8616:b0:6ce:36ab:a289 with SMTP id
 o22-20020a170906861600b006ce36aba289mr3613826ejx.127.1645127160904; 
 Thu, 17 Feb 2022 11:46:00 -0800 (PST)
Received: from [192.168.178.38] (dyndsl-091-096-223-141.ewe-ip-backbone.de.
 [91.96.223.141])
 by smtp.gmail.com with ESMTPSA id c5sm3649273edk.43.2022.02.17.11.46.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 11:46:00 -0800 (PST)
From: Anon Anonymous <hamachiach81@gmail.com>
X-Google-Original-From: Anon Anonymous <Hamachiach81@gmail.com>
Message-ID: <e4fd5735-1785-1243-b0ac-2210197901d2@gmail.com>
Date: Thu, 17 Feb 2022 20:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: qemu-devel@nongnu.org
Content-Language: en-US
Subject: I have a Question? Can you build a version with German and English
 and Spain and France and Russia and Chinese Language Pack and Handbook
 Installation Guide in PDF and Paper book with all Function in Linux, Unix and
 Windows?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=hamachiach81@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 17 Feb 2022 16:33:57 -0500
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

I have a Question?


Can you build a version with German and English and Spain and France and 
Russia and Chinese Language Pack and Handbook Installation Guide in PDF 
and Paper book with all Function in Linux, Unix and Windows?


A Book with configure Raspberry PI Emulation, Android Emulation, IOS & 
MAC & SPARC Unix Emulation and IBM PC DOS/WINDOWS/LINUX x86/amd64 
Emulation Soundblaster pro 16 awe32 awe64 Live Adlib speake Emulation.##


VHD, IMG VHDX mount unmount as Instalation Guide

Installation Guide all OS

IMA, VFD, IMG Floppy mount unmount

ISO Image CD mount unmount

Copy Tools from Harddisk to VHD, VHDx, IMG and CONVER FORMAT

Copy Tool from real Floppy to IMG, IMA VFD

Copy Tool from real CD to ISO and convert Tool from all CD-Image Files 
to ISO (NRG,BIN and other)

Creation Tool Harddisk Image Partition Tool and Format and boot Install 
CD FLoppy

A Backup & Restore Tool from Harddisk Image and Partition to Backup File

A Guide for this in German, Please.


Best King Regards



Daniel Frank Nommensen




